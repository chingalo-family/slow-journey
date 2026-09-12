import 'package:shared_preferences/shared_preferences.dart';

import '../utils/session_lock.dart';

class PreferenceService {
  PreferenceService(this._prefs);

  final SharedPreferences _prefs;

  static const _kOnboarding = 'has_completed_onboarding';
  static const _kProfileId = 'last_profile_id';
  static const _kTheme = 'app_theme';
  static const _kMorningOn = 'morning_reminder_on';
  static const _kEveningOn = 'evening_reminder_on';
  static const _kMorningTime = 'morning_reminder_time';
  static const _kEveningTime = 'evening_reminder_time';
  static const _kAutoLock = 'auto_lock_on';
  static const _kIdleMinutes = 'auto_lock_idle_minutes';
  static const _kLastActivity = 'last_activity_ms';
  static const _kSessionLocked = 'session_locked';

  bool get hasCompletedOnboarding => _prefs.getBool(_kOnboarding) ?? false;
  Future<void> setOnboardingComplete() => _prefs.setBool(_kOnboarding, true);

  String? get lastProfileId => _prefs.getString(_kProfileId);
  Future<void> setLastProfileId(String id) => _prefs.setString(_kProfileId, id);

  String get theme => _prefs.getString(_kTheme) ?? 'muted_light';
  Future<void> setTheme(String value) => _prefs.setString(_kTheme, value);

  bool get morningReminderOn => _prefs.getBool(_kMorningOn) ?? true;
  bool get eveningReminderOn => _prefs.getBool(_kEveningOn) ?? true;
  String get morningTime => _prefs.getString(_kMorningTime) ?? '07:00';
  String get eveningTime => _prefs.getString(_kEveningTime) ?? '21:00';

  Future<void> setMorningReminder({required bool on, required String time}) async {
    await _prefs.setBool(_kMorningOn, on);
    await _prefs.setString(_kMorningTime, time);
  }

  Future<void> setEveningReminder({required bool on, required String time}) async {
    await _prefs.setBool(_kEveningOn, on);
    await _prefs.setString(_kEveningTime, time);
  }

  bool get autoLockOn => _prefs.getBool(_kAutoLock) ?? false;
  int get idleMinutes =>
      SessionLock.sanitizeIdleMinutes(_prefs.getInt(_kIdleMinutes) ?? 5);
  Future<void> setAutoLock({required bool on, required int minutes}) async {
    await _prefs.setBool(_kAutoLock, on);
    await _prefs.setInt(_kIdleMinutes, minutes);
  }

  int get lastActivityMs => _prefs.getInt(_kLastActivity) ?? 0;
  Future<void> touchActivity() =>
      _prefs.setInt(_kLastActivity, DateTime.now().millisecondsSinceEpoch);

  bool get sessionLocked => _prefs.getBool(_kSessionLocked) ?? false;
  Future<void> setSessionLocked(bool value) =>
      _prefs.setBool(_kSessionLocked, value);

  Future<void> clear() => _prefs.clear();
}
