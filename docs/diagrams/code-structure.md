# Code structure

How folders in `lib/` map onto the daily loop.

```mermaid
flowchart TB
  subgraph ui [UI modules]
    onboarding[onboarding / PIN unlock]
    shell[shell/app_shell.dart]
    planner[planner / intentions]
    reflection[reflection / journey_feed]
    growth[growth]
    setup[settings]
  end
  subgraph state [app_state]
    profile[ProfileState]
    daily[DailyState]
    feed[JourneyFeedState]
    growthState[GrowthState]
    settings[SettingsState]
  end
  subgraph services [core/services]
    repo[JourneyRepository]
    notif[LocalNotificationService]
    prefs[PreferenceService]
  end
  db[(AppDatabase SQLite)]
  onboarding --> profile
  shell --> profile
  planner --> daily
  reflection --> daily
  growth --> growthState
  setup --> settings
  daily --> repo
  feed --> repo
  growthState --> repo
  profile --> repo
  settings --> notif
  settings --> prefs
  repo --> db
```

| Screen area | State | Service | Tables |
|-------------|-------|---------|--------|
| Onboarding / PIN | `ProfileState` | `JourneyRepository` | `profile` |
| Intentions / planner | `DailyState` | `JourneyRepository` | `intention` |
| Evening ritual | `DailyState` | `JourneyRepository` | `reflection`, `key_learning`, `usage_counter` |
| Feed | `JourneyFeedState` | `JourneyRepository` | `reflection` |
| Growth | `GrowthState` | `JourneyRepository` | `usage_counter`, `learning_tag_count`, `insight` |
| Reminders | `SettingsState` | `LocalNotificationService` | SharedPreferences (not SQLite) |
