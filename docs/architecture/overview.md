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
- `MyApp` bootstraps profile and day/feed/growth after first frame. If a PIN is set, a cold start shows `PinUnlockPage`. Auto-lock is optional: after 2, 5, or 10 minutes with the app inactive (paused or hidden), returning shows the PIN again. Switching away briefly does not lock. Reminders reschedule on resume.
- `AppShell` is the Phase 1 home, opening on **Feed**. Portrait phones use a floating pill; landscape and large screens use a sage navigation rail (icon + label) with a cream-sage hairline.

### Service layer (`lib/core/services/`)

| Service | Role |
|---------|------|
| `JourneyRepository` | Profile, intentions, complete-day, feed, growth reads |
| `PhotoCaptureService` | Gallery pick, native crop (16:9 / 4:3 / square / original), save photo file |
| `LocalNotificationService` | Device OS reminders with a 21-day rotating copy window |
| `PreferenceService` | Onboarding flag, reminder times, auto-lock, last profile |

### Data layer

- **SQLite** via Drift (`slow_journey_app_db.db`) — see [offline storage](./offline-storage.md)
- **SharedPreferences** — reminder toggles/times, theme cache, session lock flags
- **No HTTP** in Phase 1 — see [data sync](./data-sync.md)

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
