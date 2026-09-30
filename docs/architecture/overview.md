# Architecture Overview

**Slow Journey** is a Flutter daily-rhythm app. Phase 1 is fully offline: a local SQLite database is the source of truth. Rows carry `syncStatus` so Phase 2 can sync without a breaking migration.

Mermaid diagrams: [app flows](../diagrams/app-flows.md), [code structure](../diagrams/code-structure.md).

## Layered design

```
┌──────────────────────────────────────────┐
│              UI Layer (modules/)          │
│  Feature screens, forms, shared widgets  │
├──────────────────────────────────────────┤
│          State Layer (app_state/)         │
│  ChangeNotifier providers (Provider)     │
├──────────────────────────────────────────┤
│         Service Layer (core/services/)   │
│  Journey repository, reminders, prefs    │
├──────────────────────────────────────────┤
│           Data Layer                     │
│  SQLite (Drift) │ SharedPreferences      │
└──────────────────────────────────────────┘
```

### UI layer (`lib/modules/`)

Feature screens grouped by daily-rhythm domain: onboarding, intentions, planner, reflection, journey feed, growth, settings, and the Feed · Planner · Growth · Setup shell.

### State layer (`lib/app_state/`)

State is managed with **Provider** (`ChangeNotifier`). Providers registered in `main.dart`:

| Provider | Responsibility |
|----------|----------------|
| `ProfileState` | Local profile, PIN lock, bootstrap |
| `SettingsState` | Reminders, auto-lock idle minutes |
| `DailyState` | Selected day (any week or month), intentions, reflection |
| `JourneyFeedState` | Past reflections |
| `GrowthState` | Counters, tags, monthly insight |

Also registered as `Provider` (not notifiers): `AppDatabase`, `JourneyRepository`, `PhotoCaptureService`, `PreferenceService`, `LocalNotificationService`.

**App-level wiring:**

- `main()` loads `.env`, initializes local notifications, opens Drift, then `syncFromPreferences` so reminders match stored times.
- After the user reaches **Feed** (and after Get Started), Slow Journey requests notification permission and schedules repeating **Plan My Day** at **07:00** and **Reflect & Celebrate** at **21:00** unless the user changed them in Setup. Those OS reminders keep firing when the app is closed; Android restores them after reboot.
- `MyApp` bootstraps profile and day/feed/growth after first frame. If a PIN is set, a cold start shows `PinUnlockPage`. Auto-lock is optional: after 2, 5, or 10 minutes with the app inactive (paused or hidden), returning shows the PIN again. Switching away briefly does not lock. Reminders reschedule on resume.
- After unlock (or a cold start with no PIN), if today has no intentions and the day is still open, `TodayIntentionsGate` opens **Today's Intentions** before **Feed**. That page can be used morning, afternoon, or evening; the greeting follows the time of day. Closing that page, or setting the day, lands on Feed. A day that already has intentions, or is already closed, goes straight to Feed.
- Planner keeps **today's** evening reflection closed until **5:00 PM** (`DayRhythm.canOpenReflection`). A completed today can still be reopened. Past days allow intentions and reflection at any hour. Future days stay closed.
- `AppShell` is the Phase 1 home, opening on **Feed**. Portrait phones use a floating pill; landscape and large screens use a sage navigation rail (icon + label) with a cream-sage hairline.

### Service layer (`lib/core/services/`)

| Service | Role |
|---------|------|
| `JourneyRepository` | Profile, intentions, complete-day, feed, growth reads |
| `PhotoCaptureService` | Gallery pick, native crop (16:9 / 4:3 / square / original), save photo file |
| `LocalNotificationService` | Device OS repeating daily reminders |
| `PreferenceService` | Onboarding flag, reminder times, auto-lock, last profile |

### Data layer

- **SQLite** via Drift (`slow_journey_app_db.db`) - see [offline storage](./offline-storage.md)
- **SharedPreferences** - reminder toggles/times, theme cache, session lock flags
- **No HTTP** in Phase 1 - see [data sync](./data-sync.md)

## Project layout

```
lib/
├── main.dart
├── my_app.dart
├── app_state/app_state.dart
├── models/models.dart
├── l10n/
├── core/
│   ├── components/
│   ├── constants/
│   ├── offline_db/
│   ├── services/
│   └── utils/
└── modules/
    ├── onboarding/
    ├── intentions/
    ├── planner/
    ├── reflection/
    ├── journey_feed/
    ├── growth/
    ├── settings/
    └── shell/
```

## Phase 1 boundaries

- One local profile on the device
- No Community tab
- No DHIS2, REST, or background workmanager
- English UI only (`lib/l10n/app_en.arb`)
