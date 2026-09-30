# Slow Journey

**Slow Journey** is a mindful daily-living app built around a calm rhythm: **Pause · Reflect · Grow**.

Instead of maximizing task output like typical productivity apps, it structures each day as: set morning intentions, act through the day, and reflect in the evening. Progress is consistency and self-awareness - streaks, learnings, and wins - not raw completion counts.

In one line: a calm, offline-first reflection and intention app that helps people move through their days with intention and grow through consistency - shipping personal-first, then adding cloud sync and gentle community.

Package ID: `chingalo.family.slowjourney`

## Get the app

- [Google Play](https://play.google.com/store/apps/details?id=chingalo.family.slowjourney)
- [Website](https://chingalo.github.io/slow-journey-website/)

## Core features

| Feature | What it is |
|---------|------------|
| **Morning Intentions** | Set up to three meaningful intentions for the day. |
| **Daily Planner** | Week or month calendar, intentions checklist, and a daily wisdom quote. |
| **Evening Reflection** | What you learned, celebrations and wins, and a gratitude score. |
| **Journey Feed** | A journal-like history of past reflections. |
| **Growth** | Streaks, totals, a growth chart, key-learning tags, and a monthly insight. |
| **Setup** | Local profile, theme, optional PIN, reminders, and wipe. |

**Community Circle** (Phase 2) is a small, supportive, opt-in group that celebrates consistency - no competition or leaderboards. It is not in the app yet.

## Phases

**Phase 1 - Offline (current):** the full personal loop, with no backend. Data is saved locally first (SQLite via Drift, `slow_journey_app_db.db`). Usage counters track reflections, streaks, and intentions. Every business row has `syncStatus` so Phase 2 can sync without a breaking migration. The app is airplane-mode safe.

**Phase 2 - API + Community:** cloud accounts, two-way sync, multi-device restore, and Community Circle - layered on without breaking the offline-first experience. See [`docs/plans/`](docs/plans/README.md).

## Tech and branding

- **Stack:** Flutter, Provider, Drift / SQLite (same offline-first layering as Duka Mkononi). English-only.
- **Look:** warm and unhurried - sage on cream, Muted Light and Muted Dark, Fraunces headings and Nunito body, sprout mark.

## Run

```bash
flutter pub get
cp .env.example .env
dart run build_runner build --delete-conflicting-outputs
flutter run
```

`flutter analyze` must report **No issues found!** `flutter test` must pass.

## Documentation

App documentation lives under [`docs/`](docs/README.md):

- [`docs/architecture/`](docs/architecture/overview.md) - layers, Drift schema, reserved sync
- [`docs/features/`](docs/features/modules.md) - modules, reminders, brand
- [`docs/development/`](docs/development/setup.md) - setup, naming, localization, tests
- [`docs/user-guides/`](docs/user-guides/README.md) - shareable how-tos
- [`docs/diagrams/`](docs/diagrams/README.md) - startup and code-structure Mermaid
- [`docs/plans/`](docs/plans/README.md) - not-yet-shipped work

Keep docs, Cursor skills/rules, and implementation changes aligned in the same change set.

## Environment

Copy [`.env.example`](.env.example) to `.env` before the first run. `lib/main.dart` loads `.env` via `flutter_dotenv`. Phase 1 has no secrets and no network.

| Variable | Description |
|----------|-------------|
| `APP_NAME` | Display name (`Slow Journey`) |
| `APP_ENV` | Environment label (`phase1`) |
| `OFFLINE_ONLY` | Must stay `true` in Phase 1 |

Details: [`docs/development/environment.md`](docs/development/environment.md).

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) and [docs/GETTING_STARTED.md](docs/GETTING_STARTED.md). Please follow the [Code of Conduct](CODE_OF_CONDUCT.md).

## Security

Please report vulnerabilities privately. See [SECURITY.md](SECURITY.md).

## License

Copyright (c) 2026, **CFIS (Chingalo Family Information System)**. Licensed under the [BSD 3-Clause License](LICENSE).
