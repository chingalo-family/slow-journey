# Naming (contributors)

Names in this repository must be **readable by another contributor** without a comment. Cursor agents follow the same rules in `.cursor/skills/slow-journey-project/SKILL.md`.

Prefer a precise name over an inline comment. Do not add `//` or `/* */` in Dart.

## Shape

| Kind | Style | Examples |
|------|--------|----------|
| Files / folders | `snake_case` | `journey_repository.dart`, `notification_settings_page.dart` |
| Classes, enums | `PascalCase` | `DailyState`, `ReminderClockTime` |
| Members, locals, parameters | `camelCase` | `selectedIso`, `gratitudeScore` |
| Private members | `_` + `camelCase` | `_osAllowed`, `_lockTimer` |
| Tests | behavior in the test name | `'rolls to tomorrow when today's reminder already passed'` |

Match neighbors: `*_state.dart` / `*State`, `*_service.dart` / `*Service`, `*_util.dart` / `*Util`.

## What to name after

- **Say what it is in the domain.** `selectedIso`, `currentStreak` - not `data`, `tmp`, `val`.
- **Booleans** start with `is`, `has`, `can`: `dayComplete`, `hasPin`, `morningOn`.
- **Functions** are verb phrases: `completeDay`, `setMyDay`, `syncFromPreferences`.
- **Classes** are nouns: `JourneyRepository`, not `Helper`.
- **Loop indexes** describe the element: `slotIndex`, `destinationIndex`. Never `i` / `j` / `k`. Prefer `for (final item in items)` when the index is unused.

## Persistence

Do not rename Drift columns, SharedPreferences keys, or stored learning-tag IDs for style. Display names go through `AppLocalizations` / `L10nUtil`. See [offline storage](../architecture/offline-storage.md) and [localization](./localization.md).

## Localization keys

ARB keys are camelCase with an area prefix (`notificationMorningTitle`, `plannerNoIntentions`). The key should read like a short English label of the string’s job.
