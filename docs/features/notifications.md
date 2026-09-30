# Notifications

Device-local OS reminders. There is no in-app tray and no server push in Phase 1. User guide: [Notifications](../user-guides/notifications.md).

## What ships

| Reminder | Default | Notification ids | Payload | Tone |
|----------|---------|------------------|---------|------|
| Plan My Day | On, 07:00 | `1001` (cancels legacy `2100`–`2120`) | `morning` | Motivation to begin; set three intentions |
| Reflect & Celebrate | On, 21:00 | `1002` (cancels legacy `2200`–`2220`) | `evening` | Look back, learn, celebrate, rest |

Each slot has **40** title/body pairs in `NotificationCopyPack`. Copy is chosen from the next fire’s calendar date when Slow Journey is open. Morning and evening each use **one repeating daily** schedule (`matchDateTimeComponents: time`, ids `1001` / `1002`) so they still fire when the app is closed and after a reboot. Opening the app (or Setup → Notifications) rewrites the stored title/body. Legacy one-shot ids `2100`–`2120` and `2200`–`2220` are cancelled on sync.

Exact alarms are used when the OS allows; otherwise `inexactAllowWhileIdle` (and a retry on exact-schedule failure).

## Surfaces

| Piece | Path |
|-------|------|
| Service | `lib/core/services/local_notification_service.dart` |
| Copy pool | `lib/core/constants/notification_copy_pack.dart` |
| Next fire helper | `lib/core/utils/reminder_schedule.dart` |
| Prefs | `PreferenceService` (`morning_reminder_*`, `evening_reminder_*`) |
| Settings UI | `lib/modules/settings/notification_settings_page.dart` |
| Channel | `slow_journey_daily_rhythm` (Daily rhythm) |

## Permission

- Initialize **without** prompting (iOS `request*Permission: false`) so splash is not blocked.
- After a local profile exists, entering **Feed** (`AppShell`) and finishing **Get Started** call `activateDefaultReminders`: request OS notification (and exact-alarm) permission, then schedule.
- Opening Setup → Notifications, or turning a reminder **on**, also calls `requestPermissionIfNeeded`.
- If the OS blocks notifications, the screen shows `notificationsOsBlocked`.
- App resume calls `syncFromPreferences` so a later grant is picked up and the repeating reminder copy is rewritten.

## Android

Declared in `android/app/src/main/AndroidManifest.xml` (release and debug):

| Permission | Why |
|------------|-----|
| `POST_NOTIFICATIONS` | Android 13+ reminder banners |
| `RECEIVE_BOOT_COMPLETED` | Reschedule after reboot |
| `VIBRATE` | Channel vibration |
| `WAKE_LOCK` | Alarm delivery |
| `SCHEDULE_EXACT_ALARM` | Morning/evening clock times when the user grants exact alarms |

Do **not** declare `USE_EXACT_ALARM`. Play only allows that for calendar/alarm-clock apps. Slow Journey requests exact alarms at runtime via `requestExactAlarmsPermission()` and falls back to inexact when the OS denies it.

Do **not** declare `INTERNET` in the main manifest (debug/profile only, for Flutter tooling).

- Boot receivers from `flutter_local_notifications` so repeating schedules survive reboot (`BOOT_COMPLETED`, package replace, and common OEM quick-boot actions)
- Status icon `@drawable/ic_stat_notification`

## iOS

- `UNUserNotificationCenter` delegate set in `AppDelegate`
- Alert, badge, and sound requested when the user enables reminders
- Pending repeating reminders stay under the 64-notification iOS cap (one morning + one evening)

## Out of scope (Phase 1)

- Workmanager / background scan
- Community celebration alerts
- Extra midday reminder slot (morning and evening already vary by day)
