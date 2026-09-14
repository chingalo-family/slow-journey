# Getting started (contributors)

This is the **developer** onboarding guide for Slow Journey. If you are using the app as a person, start with [user-guides/getting-started.md](./user-guides/getting-started.md) instead.

Slow Journey is a Flutter app (`slowjourney`, application id `chingalo.family.slowjourney`). Phase 1 is fully offline: Drift + SQLite on device, Provider for state, local notifications, English UI only.

More setup detail: [development/setup.md](./development/setup.md). Architecture: [architecture/overview.md](./architecture/overview.md).

## Prerequisites

| Requirement | Notes |
|-------------|--------|
| Flutter SDK | Must provide Dart SDK `^3.13.2` (see `pubspec.yaml`) |
| Dart | Bundled with Flutter |
| Java | 17 for Android builds |
| Xcode | macOS only, for iOS simulator or device |
| Git | Clone from `https://github.com/chingalo-family/slow-journey` |

Phase 1 does not need a backend, Docker, or API keys.

## Install and run

```bash
git clone git@github.com:chingalo-family/slow-journey.git
cd slow-journey
flutter pub get
cp .env.example .env
dart run build_runner build --delete-conflicting-outputs
flutter run
```

Other run modes:

```bash
flutter run --debug
flutter run --release
```

### Environment variables

`lib/main.dart` calls `dotenv.load(fileName: '.env')` before `runApp`. Source of names: [`.env.example`](../.env.example). Full reference: [development/environment.md](./development/environment.md).

| Variable | Required | Description |
|----------|----------|-------------|
| `APP_NAME` | Yes | Display name (`Slow Journey`) |
| `APP_ENV` | Yes | Environment label (`phase1`) |
| `OFFLINE_ONLY` | Yes | Must stay `true` in Phase 1 |

Do not commit `.env`. There are no HTTP URLs or secrets in Phase 1.

## Quality gates

```bash
flutter analyze   # must print: No issues found!
flutter test
```

If you change UI copy:

```bash
# edit lib/l10n/app_en.arb
flutter gen-l10n
```

If you change Drift tables, `app_database.dart`, or migrations:

```bash
dart run build_runner build --delete-conflicting-outputs
```

After replacing `assets/brand/app_icon.png`:

```bash
dart run flutter_launcher_icons
```

Lint config is `analysis_options.yaml` (`package:flutter_lints/flutter.yaml`). Tests: [development/testing.md](./development/testing.md).

<!-- TODO: no GitHub Actions or other CI config exists in this repo yet. Add a badge and commands here when CI is added. -->

## Build

```bash
flutter build apk --release
flutter build appbundle --release
flutter build ios --release
```

Do not add `INTERNET` to the main Android manifest in Phase 1. Signing files (`android/key.properties`, keystores) stay local and gitignored.

## Project structure

```
slow-journey/
├── android/                 # Android host (Gradle Kotlin)
├── ios/                     # iOS host (Xcode Runner)
├── assets/
│   ├── brand/               # App icon and sprout mark
│   └── fonts/               # Nunito, Fraunces
├── docs/                    # Architecture, features, user guides
│   ├── architecture/
│   ├── development/
│   ├── diagrams/
│   ├── features/
│   ├── plans/               # Not-yet-shipped work (Phase 2)
│   └── user-guides/
├── lib/
│   ├── main.dart            # Entry: load .env, notifications, Drift, Provider
│   ├── my_app.dart          # MaterialApp, bootstrap, PIN gate
│   ├── app_state/           # ChangeNotifier providers
│   ├── models/
│   ├── l10n/                # app_en.arb (English template)
│   ├── core/
│   │   ├── components/      # Shared UI
│   │   ├── constants/
│   │   ├── offline_db/      # Drift tables, migrations, SQLite file
│   │   ├── services/        # Repository, prefs, reminders, photos
│   │   └── utils/
│   └── modules/             # Feature screens
│       ├── onboarding/
│       ├── intentions/
│       ├── planner/
│       ├── reflection/
│       ├── journey_feed/
│       ├── growth/
│       ├── settings/
│       └── shell/
├── test/                    # Mirrors lib/; helpers for Drift and l10n
├── pubspec.yaml
├── l10n.yaml
├── analysis_options.yaml
└── .env.example
```

SQLite file name: `slow_journey_app_db.db`. Package imports: `package:slowjourney/...`.

## Next reading

| Doc | Why |
|-----|-----|
| [CONTRIBUTING.md](../CONTRIBUTING.md) | Issues, Conventional Commits, PRs |
| [architecture/overview.md](./architecture/overview.md) | Layers and providers |
| [architecture/offline-storage.md](./architecture/offline-storage.md) | Drift schema and `syncStatus` |
| [development/naming.md](./development/naming.md) | Naming rules |
| [development/localization.md](./development/localization.md) | ARB workflow |
