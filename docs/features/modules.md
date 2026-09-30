# Feature Modules

Each feature lives under `lib/modules/`. On phones in portrait, `AppShell` uses a floating pill tab bar. Landscape and large screens use a leading `SjSideNav` rail (icon + label). See [Responsive UI](../development/responsive-ui.md). Flow diagrams: [app flows](../diagrams/app-flows.md) and [code structure](../diagrams/code-structure.md).

## Module reference

| Module | Entry screen | Status | Description |
|--------|--------------|--------|-------------|
| **Splash** | `onboarding/splash_page.dart` | Implemented | Cream field, centered sprout, then Slow Journey and tagline fade in; held ~2.2s. Native Android/iOS launch uses the same cream + sprout so the handoff is seamless. |
| **PIN unlock** | `onboarding/pin_unlock_page.dart` | Implemented | Welcome back gate with first name, PIN card, and an in-app number pad. Portrait stacks the pad under the card; landscape puts the card and pad side by side so both stay on screen |
| **Daily cycle** | `onboarding/daily_cycle_page.dart` | Implemented | Morning / evening primer, Get Started |
| **Local profile** | `onboarding/welcome_profile_page.dart` | Implemented | Name plus optional email and birthday |
| **Today's intentions** | `intentions/morning_intentions_page.dart` | Implemented | Up to three aims, Set My Day, any time today. Title is Today's Intentions; greeting is morning, afternoon, or evening. After unlock, opens when today has no intentions and the day is still open |
| **Planner** | `planner/planner_page.dart` | Implemented | Week or month calendar, checklist, wisdom quote. Today's reflection opens after 5:00 PM. Past days can take intentions or a reflection any time |
| **Evening reflection** | `reflection/evening_reflection_page.dart` | Implemented | Learning, wins, preset theme chips plus add-your-own, gratitude, cropped photo (16:9 default), full-screen viewer; fades into a full **Day complete** rest screen |
| **Journey feed** | `journey_feed/journey_feed_page.dart` | Implemented | Journal cards, streak chip, empty-state invitation (scrolls on short landscape) |
| **Growth** | `growth/growth_page.dart` | Implemented | Combined stats, weekly evening chart with labels, ranked learning tags, monthly insight |
| **Setup** | `settings/manage_profile_page.dart` | Implemented | Grouped profile, notifications, muted dark, PIN and auto-lock, wipe |
| **Notifications** | `settings/notification_settings_page.dart` | Implemented | Asks for permission on first home screen; defaults 7:00 AM / 9:00 PM, changeable here |
| **Shell** | `shell/app_shell.dart` | Implemented | Floating Feed · Planner · Growth · Setup pill on portrait phones; landscape and large screens use a rail with icon, label, and sage hairline |

**Not in Phase 1:** Community Circle tab, cloud account, Data Sync.

## Bottom destinations

| Index | Label | Default |
|-------|-------|---------|
| 0 | Feed | Home after unlock, once today's intentions are set or the prompt is closed |
| 1 | Planner | Intentions and calendar |
| 2 | Growth | Stats |
| 3 | Setup | Profile and reminders |

## Daily write pattern

Intentions and Complete Day go through `DailyState` → `JourneyRepository` → Drift. Complete Day is a single transaction (reflection + tags + counters). Incomplete intentions do not punish the streak.
