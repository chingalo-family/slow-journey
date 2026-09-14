import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import '../../core/utils/app_date.dart';
import '../../core/utils/learning_tags.dart';
import '../../core/utils/streak.dart';
import '../../models/models.dart';
import 'connection/native.dart';
import 'offline_database_migrations.dart';
import 'tables/insights.dart';
import 'tables/intentions.dart';
import 'tables/key_learnings.dart';
import 'tables/profile.dart';
import 'tables/reflections.dart';
import 'tables/usage_counters.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    Profiles,
    Intentions,
    Reflections,
    KeyLearnings,
    UsageCounters,
    LearningTagCounts,
    Insights,
    AppLogs,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]) : super(executor ?? openConnection());

  static AppDatabase? _instance;
  static AppDatabase get instance => _instance ??= AppDatabase();

  static AppDatabase createTestDatabase() => AppDatabase(openTestConnection());

  static const _uuid = Uuid();

  @override
  int get schemaVersion => offlineDatabaseSchemaVersion;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) async {
          await m.createAll();
          await customStatement(
            'CREATE UNIQUE INDEX IF NOT EXISTS idx_reflection_profile_date ON reflection (profile_id, for_date)',
          );
          await customStatement(
            'CREATE INDEX IF NOT EXISTS idx_intention_profile_date ON intention (profile_id, for_date)',
          );
          await customStatement(
            'CREATE INDEX IF NOT EXISTS idx_key_learning_reflection ON key_learning (reflection_id)',
          );
        },
        onUpgrade: (m, from, to) async {
          for (final step in offlineDatabaseMigrations) {
            if (step.from >= from && step.from < to) {
              await step.migrate(m, this);
            }
          }
        },
      );

  Future<Profile?> latestProfile() {
    return (select(profiles)..orderBy([(t) => OrderingTerm.desc(t.createdAt)]))
        .getSingleOrNull();
  }

  Future<void> upsertProfile(ProfilesCompanion row) =>
      into(profiles).insertOnConflictUpdate(row);

  Future<List<Intention>> intentionsForDate(String profileId, String date) {
    return (select(intentions)
          ..where((t) => t.profileId.equals(profileId) & t.forDate.equals(date))
          ..orderBy([(t) => OrderingTerm.asc(t.position)]))
        .get();
  }

  Future<void> replaceIntentions({
    required String profileId,
    required String date,
    required List<String> texts,
  }) async {
    await transaction(() async {
      await (delete(intentions)
            ..where((t) => t.profileId.equals(profileId) & t.forDate.equals(date)))
          .go();
      final now = DateTime.now().toIso8601String();
      for (var slotIndex = 0; slotIndex < texts.length && slotIndex < 3; slotIndex++) {
        final text = texts[slotIndex].trim();
        if (text.isEmpty) continue;
        await into(intentions).insert(
          IntentionsCompanion.insert(
            id: _uuid.v4(),
            profileId: profileId,
            forDate: date,
            body: text,
            position: slotIndex + 1,
            createdAt: now,
            updatedAt: now,
          ),
        );
      }
    });
  }

  Future<void> toggleIntention(String id, bool completed) async {
    final now = DateTime.now().toIso8601String();
    await (update(intentions)..where((t) => t.id.equals(id))).write(
      IntentionsCompanion(
        isCompleted: Value(completed ? 1 : 0),
        completedAt: Value(completed ? now : null),
        updatedAt: Value(now),
        syncStatus: const Value('notSynced'),
      ),
    );
  }

  Future<Reflection?> reflectionForDate(String profileId, String date) {
    return (select(reflections)
          ..where((t) => t.profileId.equals(profileId) & t.forDate.equals(date)))
        .getSingleOrNull();
  }

  Future<List<String>> reflectionDatesBetween({
    required String profileId,
    required String startIso,
    required String endIso,
  }) async {
    final rows = await (select(reflections)
          ..where(
            (t) =>
                t.profileId.equals(profileId) &
                t.forDate.isBiggerOrEqualValue(startIso) &
                t.forDate.isSmallerOrEqualValue(endIso),
          ))
        .get();
    return [for (final row in rows) row.forDate];
  }

  Future<List<Reflection>> reflectionsPaged(
    String profileId, {
    int limit = 400,
  }) {
    return (select(reflections)
          ..where((t) => t.profileId.equals(profileId))
          ..orderBy([(t) => OrderingTerm.desc(t.forDate)])
          ..limit(limit))
        .get();
  }

  Future<List<String>> tagsForReflection(String reflectionId) async {
    final rows = await (select(keyLearnings)
          ..where((t) => t.reflectionId.equals(reflectionId)))
        .get();
    return rows.map((r) => r.label).toList();
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
  }) async {
    await transaction(() async {
      final now = DateTime.now().toIso8601String();
      final existing = await reflectionForDate(profileId, date);
      final id = existing?.id ?? _uuid.v4();
      await into(reflections).insertOnConflictUpdate(
        ReflectionsCompanion.insert(
          id: id,
          profileId: profileId,
          forDate: date,
          title: Value(title),
          learning: learning,
          wins: wins,
          gratitudeScore: gratitudeScore,
          photoPath: Value(photoPath),
          createdAt: existing?.createdAt ?? now,
          updatedAt: now,
          syncStatus: const Value('notSynced'),
        ),
      );

      await (delete(keyLearnings)..where((t) => t.reflectionId.equals(id))).go();
      final storedTags = LearningTags.resolve(
        learning: learning,
        wins: wins,
        chosen: tags,
      );
      for (final tag in storedTags) {
        await into(keyLearnings).insert(
          KeyLearningsCompanion.insert(
            id: _uuid.v4(),
            reflectionId: id,
            label: tag,
          ),
        );
      }
      await rebuildTagCounts(profileId);

      final dates = await (select(reflections)
            ..where((t) => t.profileId.equals(profileId)))
          .get();
      final set = dates.map((r) => r.forDate).toSet();
      final current = StreakCalculator.currentStreak(set, date);
      final longest = StreakCalculator.longestStreak(set);
      final counters = await usageFor(profileId);
      await into(usageCounters).insertOnConflictUpdate(
        UsageCountersCompanion.insert(
          profileId: profileId,
          totalReflections: Value(set.length),
          currentStreak: Value(current),
          longestStreak: Value(longest),
          intentionsSetCount: Value(counters?.intentionsSetCount ?? 0),
          intentionsCompletedCount:
              Value(counters?.intentionsCompletedCount ?? 0),
          daysCompleted: Value(set.length),
          appOpenCount: Value(counters?.appOpenCount ?? 0),
          lastActiveDate: date,
          updatedAt: now,
          syncStatus: const Value('notSynced'),
        ),
      );
    });
  }

  Future<UsageCounter?> usageFor(String profileId) {
    return (select(usageCounters)..where((t) => t.profileId.equals(profileId)))
        .getSingleOrNull();
  }

  Future<void> ensureCounters(String profileId) async {
    final existing = await usageFor(profileId);
    if (existing != null) return;
    final today = AppDate.isoDate();
    await into(usageCounters).insert(
      UsageCountersCompanion.insert(
        profileId: profileId,
        lastActiveDate: today,
        updatedAt: DateTime.now().toIso8601String(),
      ),
    );
  }

  Future<void> bumpAppOpen(String profileId) async {
    await ensureCounters(profileId);
    final row = await usageFor(profileId);
    if (row == null) return;
    await (update(usageCounters)..where((t) => t.profileId.equals(profileId)))
        .write(
      UsageCountersCompanion(
        appOpenCount: Value(row.appOpenCount + 1),
        lastActiveDate: Value(AppDate.isoDate()),
        updatedAt: Value(DateTime.now().toIso8601String()),
        syncStatus: const Value('notSynced'),
      ),
    );
  }

  Future<void> addIntentionsSet(String profileId, int count) async {
    await ensureCounters(profileId);
    final row = await usageFor(profileId);
    if (row == null) return;
    await (update(usageCounters)..where((t) => t.profileId.equals(profileId)))
        .write(
      UsageCountersCompanion(
        intentionsSetCount: Value(row.intentionsSetCount + count),
        lastActiveDate: Value(AppDate.isoDate()),
        updatedAt: Value(DateTime.now().toIso8601String()),
        syncStatus: const Value('notSynced'),
      ),
    );
  }

  Future<void> addIntentionCompleted(String profileId, int delta) async {
    await ensureCounters(profileId);
    final row = await usageFor(profileId);
    if (row == null) return;
    await (update(usageCounters)..where((t) => t.profileId.equals(profileId)))
        .write(
      UsageCountersCompanion(
        intentionsCompletedCount: Value(
          (row.intentionsCompletedCount + delta).clamp(0, 1 << 30),
        ),
        updatedAt: Value(DateTime.now().toIso8601String()),
        syncStatus: const Value('notSynced'),
      ),
    );
  }

  Future<List<ChartBucket>> weeklyCounts(String profileId) async {
    final rows = await customSelect(
      '''
      SELECT strftime('%W', for_date) as week, COUNT(*) as c
      FROM reflection
      WHERE profile_id = ?
      GROUP BY week
      ORDER BY week
      LIMIT 8
      ''',
      variables: [Variable.withString(profileId)],
      readsFrom: {reflections},
    ).get();
    return [
      for (final row in rows)
        ChartBucket(
          label: 'W${row.read<String>('week')}',
          count: row.read<int>('c'),
        ),
    ];
  }

  Future<Map<String, int>> tagTotals(String profileId) async {
    final rows = await (select(learningTagCounts)
          ..where((t) => t.profileId.equals(profileId)))
        .get();
    return {for (final r in rows) r.label: r.count};
  }

  Future<void> rebuildTagCounts(String profileId) async {
    await (delete(learningTagCounts)
          ..where((t) => t.profileId.equals(profileId)))
        .go();
    final rows = await customSelect(
      'SELECT key_learning.label AS label, COUNT(*) AS c '
      'FROM key_learning INNER JOIN reflection '
      'ON reflection.id = key_learning.reflection_id '
      'WHERE reflection.profile_id = ? GROUP BY key_learning.label',
      variables: [Variable.withString(profileId)],
      readsFrom: {keyLearnings, reflections},
    ).get();
    for (final row in rows) {
      await into(learningTagCounts).insert(
        LearningTagCountsCompanion.insert(
          profileId: profileId,
          label: row.read<String>('label'),
          count: Value(row.read<int>('c')),
        ),
      );
    }
  }

  Future<Insight?> insightForPeriod(String profileId, String period) {
    return (select(insights)
          ..where((t) => t.profileId.equals(profileId) & t.period.equals(period)))
        .getSingleOrNull();
  }

  Future<void> saveInsight(InsightsCompanion row) =>
      into(insights).insertOnConflictUpdate(row);

  Future<void> log(String level, String message) {
    return into(appLogs).insert(
      AppLogsCompanion.insert(
        id: _uuid.v4(),
        level: level,
        message: message,
        createdAt: DateTime.now().toIso8601String(),
      ),
    );
  }

  Future<void> wipeAll() async {
    await transaction(() async {
      await delete(keyLearnings).go();
      await delete(learningTagCounts).go();
      await delete(insights).go();
      await delete(intentions).go();
      await delete(reflections).go();
      await delete(usageCounters).go();
      await delete(appLogs).go();
      await delete(profiles).go();
    });
  }
}
