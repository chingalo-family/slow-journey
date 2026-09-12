import 'package:flutter/foundation.dart';

import '../../core/services/journey_repository.dart';
import '../../core/services/local_notification_service.dart';
import '../../core/services/preference_service.dart';
import '../../core/utils/app_date.dart';
import '../../core/utils/day_rhythm.dart';
import '../../core/utils/pin_hasher.dart';
import '../../core/utils/session_lock.dart';
import '../../models/models.dart';

class ProfileState extends ChangeNotifier {
  ProfileState({
    required this.repo,
    required this.prefs,
  });

  final JourneyRepository repo;
  final PreferenceService prefs;

  ProfileModel? profile;
  bool loading = true;
  bool locked = false;

  Future<void> bootstrap() async {
    loading = true;
    notifyListeners();
    profile = await repo.loadProfile();
    if (profile != null) {
      await repo.noteOpen(profile!.id);
      prefs.setLastProfileId(profile!.id);
      prefs.setTheme(profile!.theme);
      locked = SessionLock.requiresUnlockWhenHasPin(hasPin: profile!.hasPin);
      if (locked) {
        await prefs.setSessionLocked(true);
      }
    }
    loading = false;
    notifyListeners();
  }

  void _setLocked(bool value) {
    locked = value;
    prefs.setSessionLocked(value);
    notifyListeners();
  }

  Future<void> create({
    required String name,
    String? email,
    String? birthday,
  }) async {
    profile = await repo.createProfile(
      name: name,
      email: email,
      birthday: birthday,
    );
    await prefs.setOnboardingComplete();
    await prefs.setLastProfileId(profile!.id);
    locked = false;
    notifyListeners();
  }

  Future<void> save(ProfileModel next) async {
    await repo.updateProfile(next);
    profile = next;
    await prefs.setTheme(next.theme);
    notifyListeners();
  }

  Future<bool> setPin(String pin) async {
    if (profile == null) return false;
    if (!PinHasher.isValid(pin)) return false;
    await repo.setPin(profile!, pin);
    profile = await repo.loadProfile();
    locked = false;
    await prefs.setSessionLocked(false);
    await prefs.touchActivity();
    notifyListeners();
    return profile?.hasPin == true;
  }

  Future<void> clearPin() async {
    if (profile == null) return;
    await repo.updateProfile(profile!.copyWith(clearPin: true));
    profile = await repo.loadProfile();
    locked = false;
    await prefs.setSessionLocked(false);
    notifyListeners();
  }

  bool unlock(String pin) {
    if (profile == null || !profile!.hasPin) return true;
    final ok = PinHasher.matches(pin, profile!.id, profile!.pinHash!);
    if (ok) {
      locked = false;
      prefs.setSessionLocked(false);
      prefs.touchActivity();
      notifyListeners();
    }
    return ok;
  }

  void lockAfterAppInactive({
    required DateTime inactiveSince,
    DateTime? now,
  }) {
    if (!SessionLock.shouldLockAfterAppInactive(
      hasPin: profile?.hasPin == true,
      autoLockOn: prefs.autoLockOn,
      inactiveSinceMs: inactiveSince.millisecondsSinceEpoch,
      idleMinutes: prefs.idleMinutes,
      now: now ?? DateTime.now(),
    )) {
      return;
    }
    _setLocked(true);
  }

  Future<void> wipe() async {
    await repo.wipe();
    await prefs.clear();
    profile = null;
    locked = false;
    notifyListeners();
  }
}

class SettingsState extends ChangeNotifier {
  SettingsState({
    required this.prefs,
    required this.notifications,
  });

  final PreferenceService prefs;
  final LocalNotificationService notifications;

  late bool morningOn;
  late bool eveningOn;
  late String morningTime;
  late String eveningTime;
  late bool autoLockOn;
  late int idleMinutes;

  void load() {
    morningOn = prefs.morningReminderOn;
    eveningOn = prefs.eveningReminderOn;
    morningTime = prefs.morningTime;
    eveningTime = prefs.eveningTime;
    autoLockOn = prefs.autoLockOn;
    idleMinutes = prefs.idleMinutes;
    notifyListeners();
  }

  Future<bool> setMorning({bool? on, String? time}) async {
    final nextOn = on ?? morningOn;
    if (nextOn) {
      final granted = await notifications.requestPermissionIfNeeded();
      if (!granted && on == true) {
        return false;
      }
    }
    morningOn = on ?? morningOn;
    morningTime = time ?? morningTime;
    await prefs.setMorningReminder(on: morningOn, time: morningTime);
    await notifications.syncFromPreferences(prefs);
    notifyListeners();
    return true;
  }

  Future<bool> setEvening({bool? on, String? time}) async {
    final nextOn = on ?? eveningOn;
    if (nextOn) {
      final granted = await notifications.requestPermissionIfNeeded();
      if (!granted && on == true) {
        return false;
      }
    }
    eveningOn = on ?? eveningOn;
    eveningTime = time ?? eveningTime;
    await prefs.setEveningReminder(on: eveningOn, time: eveningTime);
    await notifications.syncFromPreferences(prefs);
    notifyListeners();
    return true;
  }

  Future<void> setAutoLock({bool? on, int? minutes}) async {
    autoLockOn = on ?? autoLockOn;
    idleMinutes = SessionLock.sanitizeIdleMinutes(minutes ?? idleMinutes);
    await prefs.setAutoLock(on: autoLockOn, minutes: idleMinutes);
    await prefs.touchActivity();
    notifyListeners();
  }
}

class DailyState extends ChangeNotifier {
  DailyState(this.repo);

  final JourneyRepository repo;

  DateTime selectedDay = AppDate.dateOnly(DateTime.now());
  List<IntentionModel> intentions = [];
  ReflectionModel? reflection;
  Set<String> completedIsoDates = {};
  bool loading = false;

  String get selectedIso => AppDate.isoDate(selectedDay);

  bool get dayComplete => reflection != null;

  int get honoredCount =>
      intentions.where((item) => item.isCompleted).length;

  DayNextKind nextKind([DateTime? now]) => DayRhythm.nextKind(
        selectedDay: selectedDay,
        now: now ?? DateTime.now(),
        hasIntentions: intentions.isNotEmpty,
        dayComplete: dayComplete,
      );

  Future<void> load(
    String profileId, {
    DateTime? day,
    DateTime? completedRangeStart,
    DateTime? completedRangeEnd,
  }) async {
    if (day != null) selectedDay = AppDate.dateOnly(day);
    loading = true;
    notifyListeners();
    intentions = await repo.intentions(profileId, selectedIso);
    reflection = await repo.reflection(profileId, selectedIso);
    final week = AppDate.weekContaining(selectedDay);
    final rangeStart = completedRangeStart ?? week.first;
    final rangeEnd = completedRangeEnd ?? week.last;
    completedIsoDates = await repo.completedDates(
      profileId: profileId,
      startIso: AppDate.isoDate(rangeStart),
      endIso: AppDate.isoDate(rangeEnd),
    );
    loading = false;
    notifyListeners();
  }

  Future<void> setMyDay(String profileId, List<String> texts) async {
    await repo.setDay(profileId, selectedIso, texts);
    await load(profileId);
  }

  Future<void> toggle(String profileId, IntentionModel item) async {
    await repo.toggleIntention(
      profileId: profileId,
      intention: item,
      completed: !item.isCompleted,
    );
    await load(profileId);
  }

  Future<void> completeDay({
    required String profileId,
    required String learning,
    required String wins,
    required int gratitude,
    String? title,
    String? photoPath,
  }) async {
    await repo.completeDay(
      profileId: profileId,
      date: selectedIso,
      learning: learning,
      wins: wins,
      gratitudeScore: gratitude,
      title: title,
      photoPath: photoPath,
    );
    await load(profileId);
  }
}

class JourneyFeedState extends ChangeNotifier {
  JourneyFeedState(this.repo);

  final JourneyRepository repo;
  List<ReflectionModel> items = [];
  UsageCounterModel? counters;

  Future<void> load(String profileId) async {
    items = await repo.feed(profileId);
    counters = await repo.counters(profileId);
    notifyListeners();
  }
}

class GrowthState extends ChangeNotifier {
  GrowthState(this.repo);

  final JourneyRepository repo;
  UsageCounterModel? counters;
  List<ChartBucket> buckets = [];
  Map<String, int> tags = {};
  InsightModel? insight;

  Future<void> load(String profileId) async {
    counters = await repo.counters(profileId);
    buckets = await repo.chart(profileId);
    tags = await repo.tags(profileId);
    insight = await repo.monthlyInsight(profileId);
    notifyListeners();
  }
}
