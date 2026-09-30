import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/data/latest_all.dart' as tzdata;
import 'package:timezone/timezone.dart' as tz;

import '../constants/notification_copy_pack.dart';
import '../utils/l10n_util.dart';
import '../utils/reminder_schedule.dart';
import 'preference_service.dart';

class LocalNotificationService {
  LocalNotificationService();

  static const morningId = 1001;
  static const eveningId = 1002;
  static const morningHorizonStart = 2100;
  static const eveningHorizonStart = 2200;
  static const horizonDays = 21;
  static const channelId = 'slow_journey_daily_rhythm';
  static const _fallbackTimeZone = 'Africa/Dar_es_Salaam';
  static const _androidIcon = '@drawable/ic_stat_notification';

  final FlutterLocalNotificationsPlugin _plugin =
      FlutterLocalNotificationsPlugin();

  bool _initialized = false;
  bool _unsupported = false;

  bool get isSupported {
    if (kIsWeb) {
      return false;
    }
    return Platform.isAndroid || Platform.isIOS;
  }

  bool get isReady => _initialized;

  Future<void> initialize() async {
    if (_initialized || _unsupported) {
      return;
    }
    if (!isSupported) {
      _unsupported = true;
      return;
    }
    try {
      tzdata.initializeTimeZones();
      await ensureLocalTimezone();
      const android = AndroidInitializationSettings(_androidIcon);
      const ios = DarwinInitializationSettings(
        requestAlertPermission: false,
        requestBadgePermission: false,
        requestSoundPermission: false,
        defaultPresentAlert: true,
        defaultPresentBadge: true,
        defaultPresentSound: true,
        defaultPresentBanner: true,
        defaultPresentList: true,
      );
      await _plugin.initialize(
        const InitializationSettings(android: android, iOS: ios),
      );
      await _ensureAndroidChannel();
      _initialized = true;
    } catch (_) {
      _unsupported = true;
    }
  }

  Future<void> ensureLocalTimezone() async {
    tzdata.initializeTimeZones();
    var identifier = _fallbackTimeZone;
    try {
      final name = await FlutterTimezone.getLocalTimezone();
      if (name.isNotEmpty) {
        identifier = name;
      }
    } catch (_) {}
    try {
      tz.setLocalLocation(tz.getLocation(identifier));
    } catch (_) {
      tz.setLocalLocation(tz.getLocation(_fallbackTimeZone));
    }
  }

  Future<bool> requestPermissionIfNeeded() async {
    await initialize();
    if (!_initialized) {
      return false;
    }
    try {
      if (Platform.isAndroid) {
        final android = _plugin
            .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin
            >();
        final granted = await android?.requestNotificationsPermission();
        await android?.requestExactAlarmsPermission();
        return granted ?? false;
      }
      if (Platform.isIOS) {
        final ios = _plugin
            .resolvePlatformSpecificImplementation<
              IOSFlutterLocalNotificationsPlugin
            >();
        final granted = await ios?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
        return granted ?? false;
      }
    } catch (_) {}
    return false;
  }

  Future<bool> areNotificationsAllowed() async {
    if (!isSupported) {
      return true;
    }
    await initialize();
    if (!_initialized) {
      return false;
    }
    try {
      if (Platform.isAndroid) {
        final android = _plugin
            .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin
            >();
        return await android?.areNotificationsEnabled() ?? true;
      }
      if (Platform.isIOS) {
        final ios = _plugin
            .resolvePlatformSpecificImplementation<
              IOSFlutterLocalNotificationsPlugin
            >();
        final options = await ios?.checkPermissions();
        return options?.isEnabled ?? false;
      }
    } catch (_) {}
    return true;
  }

  Future<void> syncFromPreferences(PreferenceService prefs) async {
    await initialize();
    if (!_initialized) {
      return;
    }
    await ensureLocalTimezone();
    await _ensureAndroidChannel();
    await _cancelScheduledReminders();
    final allowed = await areNotificationsAllowed();
    if (!allowed) {
      return;
    }
    final l10n = L10nUtil.english();
    final mode = await _androidScheduleMode();
    if (prefs.morningReminderOn) {
      await _scheduleRepeatingDaily(
        id: morningId,
        time: prefs.morningTime,
        payload: 'morning',
        mode: mode,
        copyForDate: (date) => NotificationCopyPack.morningForDate(date, l10n),
      );
    }
    if (prefs.eveningReminderOn) {
      await _scheduleRepeatingDaily(
        id: eveningId,
        time: prefs.eveningTime,
        payload: 'evening',
        mode: mode,
        copyForDate: (date) => NotificationCopyPack.eveningForDate(date, l10n),
      );
    }
  }

  Future<void> _ensureAndroidChannel() async {
    if (!Platform.isAndroid) {
      return;
    }
    final android = _plugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >();
    if (android == null) {
      return;
    }
    final l10n = L10nUtil.english();
    await android.createNotificationChannel(
      AndroidNotificationChannel(
        channelId,
        l10n.notificationChannelName,
        description: l10n.notificationChannelDescription,
        importance: Importance.high,
        playSound: true,
        enableVibration: true,
        showBadge: true,
      ),
    );
  }

  Future<NotificationDetails> _details(String body) async {
    final l10n = L10nUtil.english();
    return NotificationDetails(
      android: AndroidNotificationDetails(
        channelId,
        l10n.notificationChannelName,
        channelDescription: l10n.notificationChannelDescription,
        importance: Importance.high,
        priority: Priority.high,
        icon: _androidIcon,
        playSound: true,
        enableVibration: true,
        category: AndroidNotificationCategory.reminder,
        visibility: NotificationVisibility.public,
        styleInformation: BigTextStyleInformation(body),
      ),
      iOS: DarwinNotificationDetails(
        presentAlert: true,
        presentBadge: true,
        presentSound: true,
        presentBanner: true,
        presentList: true,
        interruptionLevel: InterruptionLevel.active,
        threadIdentifier: 'slow-journey-reminders',
      ),
    );
  }

  Future<AndroidScheduleMode> _androidScheduleMode() async {
    if (!Platform.isAndroid) {
      return AndroidScheduleMode.exactAllowWhileIdle;
    }
    try {
      final android = _plugin
          .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin
          >();
      final canExact = await android?.canScheduleExactNotifications();
      if (canExact == true) {
        return AndroidScheduleMode.exactAllowWhileIdle;
      }
    } catch (_) {}
    return AndroidScheduleMode.inexactAllowWhileIdle;
  }

  Future<void> _cancelScheduledReminders() async {
    await _plugin.cancel(morningId);
    await _plugin.cancel(eveningId);
    for (var dayOffset = 0; dayOffset < horizonDays; dayOffset++) {
      await _plugin.cancel(morningHorizonStart + dayOffset);
      await _plugin.cancel(eveningHorizonStart + dayOffset);
    }
  }

  Future<void> _scheduleRepeatingDaily({
    required int id,
    required String time,
    required String payload,
    required AndroidScheduleMode mode,
    required ReminderCopy Function(DateTime date) copyForDate,
  }) async {
    final clock = ReminderClockTime.parse(time);
    final fire = ReminderClockTime.nextDailyFire(
      location: tz.local,
      now: DateTime.now(),
      hour: clock.hour,
      minute: clock.minute,
    );
    final copy = copyForDate(fire);
    await _zonedScheduleRepeating(
      id: id,
      title: copy.title,
      body: copy.body,
      fire: fire,
      payload: payload,
      mode: mode,
    );
  }

  Future<void> _zonedScheduleRepeating({
    required int id,
    required String title,
    required String body,
    required tz.TZDateTime fire,
    required String payload,
    required AndroidScheduleMode mode,
  }) async {
    final details = await _details(body);
    try {
      await _plugin.zonedSchedule(
        id,
        title,
        body,
        fire,
        details,
        androidScheduleMode: mode,
        payload: payload,
        matchDateTimeComponents: DateTimeComponents.time,
      );
    } catch (_) {
      if (mode == AndroidScheduleMode.inexactAllowWhileIdle) {
        return;
      }
      try {
        await _plugin.zonedSchedule(
          id,
          title,
          body,
          fire,
          details,
          androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
          payload: payload,
          matchDateTimeComponents: DateTimeComponents.time,
        );
      } catch (_) {}
    }
  }
}
