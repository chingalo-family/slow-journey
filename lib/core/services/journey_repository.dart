import 'dart:io';

import 'package:drift/drift.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

import '../../models/models.dart';
import '../offline_db/app_database.dart';
import '../utils/app_date.dart';
import '../utils/l10n_util.dart';
import '../utils/pin_hasher.dart';

class JourneyRepository {
  JourneyRepository(this.db);

  final AppDatabase db;
  static const _uuid = Uuid();

  Future<ProfileModel?> loadProfile() async {
    final row = await db.latestProfile();
    return row == null ? null : _profile(row);
  }

  Future<ProfileModel> createProfile({
    required String name,
    String? email,
    String? birthday,
  }) async {
    final now = DateTime.now().toIso8601String();
    final id = _uuid.v4();
    final today = AppDate.isoDate();
    await db.upsertProfile(
      ProfilesCompanion.insert(
        id: id,
        name: name.trim(),
        email: Value(email?.trim().isEmpty == true ? null : email?.trim()),
        birthday: Value(birthday),
        memberSince: today,
        createdAt: now,
        updatedAt: now,
      ),
    );
    await db.ensureCounters(id);
    return (await loadProfile())!;
  }

  Future<void> updateProfile(ProfileModel profile) {
    return db.upsertProfile(
      ProfilesCompanion(
        id: Value(profile.id),
        name: Value(profile.name),
        email: Value(profile.email),
        birthday: Value(profile.birthday),
        memberSince: Value(profile.memberSince),
        theme: Value(profile.theme),
        pinHash: Value(profile.pinHash),
        syncStatus: const Value('notSynced'),
        createdAt: Value(profile.createdAt),
        updatedAt: Value(DateTime.now().toIso8601String()),
      ),
    );
  }

  Future<void> setPin(ProfileModel profile, String pin) {
    return updateProfile(
      profile.copyWith(pinHash: PinHasher.hash(pin, profile.id)),
    );
  }

  Future<List<IntentionModel>> intentions(String profileId, String date) async {
    final rows = await db.intentionsForDate(profileId, date);
    return rows.map(_intention).toList();
  }

  Future<void> setDay(String profileId, String date, List<String> texts) async {
    final existing = await db.intentionsForDate(profileId, date);
    await db.replaceIntentions(profileId: profileId, date: date, texts: texts);
    final added = texts.where((t) => t.trim().isNotEmpty).length;
    if (existing.isEmpty && added > 0) {
      await db.addIntentionsSet(profileId, added);
    }
  }

  Future<void> toggleIntention({
    required String profileId,
    required IntentionModel intention,
    required bool completed,
  }) async {
    if (intention.isCompleted == completed) return;
    await db.toggleIntention(intention.id, completed);
    await db.addIntentionCompleted(profileId, completed ? 1 : -1);
  }

  Future<ReflectionModel?> reflection(String profileId, String date) async {
    final row = await db.reflectionForDate(profileId, date);
    if (row == null) return null;
    final tags = await db.tagsForReflection(row.id);
    return _reflection(row, tags);
  }

  Future<Set<String>> completedDates({
    required String profileId,
    required String startIso,
    required String endIso,
  }) async {
    final dates = await db.reflectionDatesBetween(
      profileId: profileId,
      startIso: startIso,
      endIso: endIso,
    );
    return dates.toSet();
  }

  Future<List<ReflectionModel>> feed(String profileId) async {
    final rows = await db.reflectionsPaged(profileId);
    final out = <ReflectionModel>[];
    for (final row in rows) {
      out.add(_reflection(row, await db.tagsForReflection(row.id)));
    }
    return out;
  }

  Future<void> completeDay({
    required String profileId,
    required String date,
    required String learning,
    required String wins,
    required int gratitudeScore,
    String? title,
    String? photoPath,
    List<String>? tags,
  }) {
    return db.completeDay(
      profileId: profileId,
      date: date,
      learning: learning,
      wins: wins,
      gratitudeScore: gratitudeScore,
      title: title,
      photoPath: photoPath,
      tags: tags,
    );
  }

  Future<UsageCounterModel> counters(String profileId) async {
    await db.ensureCounters(profileId);
    final row = await db.usageFor(profileId);
    if (row == null) {
      return UsageCounterModel.empty(profileId, AppDate.isoDate());
    }
    return UsageCounterModel(
      profileId: row.profileId,
      totalReflections: row.totalReflections,
      currentStreak: row.currentStreak,
      longestStreak: row.longestStreak,
      intentionsSetCount: row.intentionsSetCount,
      intentionsCompletedCount: row.intentionsCompletedCount,
      daysCompleted: row.daysCompleted,
      appOpenCount: row.appOpenCount,
      lastActiveDate: row.lastActiveDate,
      updatedAt: row.updatedAt,
      syncStatus: row.syncStatus,
    );
  }

  Future<List<ChartBucket>> chart(String profileId) => db.weeklyCounts(profileId);

  Future<Map<String, int>> tags(String profileId) => db.tagTotals(profileId);

  Future<InsightModel> monthlyInsight(String profileId) async {
    final period = AppDate.periodKey();
    final c = await counters(profileId);
    if (c.totalReflections == 0) {
      return InsightModel(
        id: 'empty',
        profileId: profileId,
        period: period,
        body: L10nUtil.english().insightEmpty,
        createdAt: DateTime.now().toIso8601String(),
        syncStatus: 'notSynced',
      );
    }
    final existing = await db.insightForPeriod(profileId, period);
    if (existing != null) {
      return InsightModel(
        id: existing.id,
        profileId: existing.profileId,
        period: existing.period,
        body: existing.body,
        createdAt: existing.createdAt,
        syncStatus: existing.syncStatus,
      );
    }
    final tagMap = await tags(profileId);
    String topId = 'Rest';
    if (tagMap.isNotEmpty) {
      final sorted = tagMap.entries.toList()
        ..sort((a, b) => b.value.compareTo(a.value));
      topId = sorted.first.key;
    }
    final l10n = L10nUtil.english();
    final habit = L10nUtil.learningTagLabel(l10n, topId).toLowerCase();
    final body = c.currentStreak >= 7
        ? l10n.insightLongStreak(habit)
        : l10n.insightDefault(habit);
    final id = _uuid.v4();
    final now = DateTime.now().toIso8601String();
    await db.saveInsight(
      InsightsCompanion.insert(
        id: id,
        profileId: profileId,
        period: period,
        body: body,
        createdAt: now,
      ),
    );
    return InsightModel(
      id: id,
      profileId: profileId,
      period: period,
      body: body,
      createdAt: now,
      syncStatus: 'notSynced',
    );
  }

  Future<String> savePhoto(File source) async {
    final dir = await getApplicationDocumentsDirectory();
    final photos = Directory(p.join(dir.path, 'photos'));
    if (!await photos.exists()) await photos.create(recursive: true);
    final dest = File(p.join(photos.path, '${_uuid.v4()}.jpg'));
    await source.copy(dest.path);
    return dest.path;
  }

  Future<void> noteOpen(String profileId) => db.bumpAppOpen(profileId);

  Future<void> wipe() => db.wipeAll();

  ProfileModel _profile(Profile row) => ProfileModel(
        id: row.id,
        name: row.name,
        email: row.email,
        birthday: row.birthday,
        memberSince: row.memberSince,
        theme: row.theme,
        pinHash: row.pinHash,
        syncStatus: row.syncStatus,
        createdAt: row.createdAt,
        updatedAt: row.updatedAt,
      );

  IntentionModel _intention(Intention row) => IntentionModel(
        id: row.id,
        profileId: row.profileId,
        forDate: row.forDate,
        text: row.body,
        position: row.position,
        isCompleted: row.isCompleted == 1,
        completedAt: row.completedAt,
        syncStatus: row.syncStatus,
        createdAt: row.createdAt,
        updatedAt: row.updatedAt,
      );

  ReflectionModel _reflection(Reflection row, List<String> tags) =>
      ReflectionModel(
        id: row.id,
        profileId: row.profileId,
        forDate: row.forDate,
        title: row.title,
        learning: row.learning,
        wins: row.wins,
        gratitudeScore: row.gratitudeScore,
        photoPath: row.photoPath,
        syncStatus: row.syncStatus,
        createdAt: row.createdAt,
        updatedAt: row.updatedAt,
        tags: tags,
      );
}
