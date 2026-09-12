---
name: slow-journey-project
description: Slow Journey Flutter conventions for mobile app work. Use when implementing features, fixing bugs, reviewing changes, or verifying work in this repository. Includes meaningful names, offline-first Drift, English-only copy, and required flutter analyze / flutter test.
---

# Slow Journey Project Skill

Use this skill whenever working in this repository. Adapted from Duka Mkononi’s project skill: same quality bar, no DHIS2 or bilingual ARB.

## Project identity
- Product: Slow Journey (Pause · Reflect · Grow)
- Display name: **Slow Journey** (iOS and Android)
- Dart package: `slowjourney`
- Application id / bundle id: `chingalo.family.slowjourney`
- Stack: Flutter, Provider (`ChangeNotifier`), Drift + SQLite, local notifications
- Phase 1: fully offline. No HTTP, no community.
- Platforms: Android / iOS

## First-step checklist
On **every** task:
- Follow `.cursor/skills/slow-journey-project/SKILL.md`
- Follow `.cursor/skills/slow-journey-offline/SKILL.md` when Drift, migrations, counters, or `syncStatus` change
- Follow `.cursor/skills/slow-journey-localization/SKILL.md` when any user-facing label, hint, snackbar, notification, or empty-state copy changes

Then:
1. Read `README.md` and `docs/README.md` for product and docs index (naming: `docs/development/naming.md`).
2. Identify the work surface: `lib/modules/*`, `lib/app_state/*`, `lib/core/services/*`, `lib/core/offline_db/*`, `lib/models/*`.
3. Map changes UI → state → service → SQLite before editing.

## Implementation map
- Feature screens: `lib/modules/` (onboarding, intentions, planner, reflection, journey_feed, growth, settings, shell)
- State: `lib/app_state/app_state.dart`
- Business logic: `lib/core/services/`
- Offline DB: `lib/core/offline_db/`
- Shared UI: `lib/core/components/`
- Tokens / quotes: `lib/core/constants/`
- Models: `lib/models/`
- English copy: `lib/l10n/app_en.arb` via `AppLocalizations` / `context.l10n`
- Tests: `test/` mirroring `lib/`
- Env: `.env` (no secrets)

## Consistency rules
- Keep business logic in services, not widgets.
- Prefer `lib/core/components/` before one-off UI.
- Use package imports (`package:slowjourney/...`).
- Offline-first: every write goes to SQLite with `syncStatus: notSynced`. Do not add network calls in Phase 1.
- Add or update tests when logic changes (streaks, counters, repository, dates).
- After schema/table edits, run Drift codegen.
- **Localization:** never add hardcoded UI strings. Add keys to `lib/l10n/app_en.arb`, use `context.l10n` or `L10nUtil.english()`, run `flutter gen-l10n`. Do not add a second locale until asked.
- **Meaningful names:** readable without a comment. See table below.
- **Descriptive loop indexes:** never `i` / `j` / `k`. Use `slotIndex`, `destinationIndex`, `barIndex`. Prefer `for (final item in items)` when the index is unused.
- **No inline comments:** do not add `//` or `/* */` in new or edited Dart. Do not leave commented-out code.

## Meaningful names

| Kind | Convention | Good | Avoid |
|------|------------|------|--------|
| Files | `snake_case` | `journey_repository.dart` | `utils2.dart` |
| Classes | `PascalCase` nouns | `DailyState`, `UsageCounterModel` | `Helper`, `Mgr` |
| Locals | `camelCase` domain words | `selectedIso`, `gratitudeScore` | `data`, `tmp`, `val` |
| Booleans | `is` / `has` / `can` | `dayComplete`, `hasPin` | `flag` |
| Functions | verb phrase | `completeDay`, `setMyDay` | `handle`, `doIt` |
| Tests | behavior | `'complete day increments current streak'` | `'test1'` |

Do **not** rename persisted Drift columns or preference keys for style.

## After any code change
```bash
git status
git diff
```

If conventions drift, update `.cursor/skills/` and `.cursor/rules/` in the same change.

## Required verification
```bash
flutter pub get
flutter analyze
flutter test
```

`flutter analyze` must print **No issues found!**

If ARB / UI copy changed:

```bash
flutter gen-l10n
```

If Drift tables, `app_database.dart`, or migrations changed:

```bash
dart run build_runner build --delete-conflicting-outputs
```

## Suggested tests
- Utils: `test/core/utils/`
- Offline / repository: `test/core/offline_db/`
- Widgets: `test/modules/`
- Broad change: full `flutter test`

**Always** update matching `docs/**/*.md` (and `README.md` when setup/scope changed) in the same change set. Keep `docs/diagrams/` aligned when screens, providers, or services change.

## Done criteria
- `git status` / `git diff` reviewed
- `flutter analyze` reports **No issues found!**
- `flutter test` passes
- Matching `docs/**/*.md` updated for behavior, modules, reminders, schema, or setup changes
- Generated Drift files committed when regenerated
- Display name stays **Slow Journey** on iOS and Android
- User-facing string changes include matching `app_en.arb` updates and `AppLocalizations` usage
- No new network / community / DHIS2 code in Phase 1
