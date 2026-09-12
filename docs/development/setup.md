# Development Setup

## Prerequisites

| Requirement | Version / notes |
|-------------|-----------------|
| Flutter SDK | See `pubspec.yaml` (`sdk: ^3.13.2`) |
| Dart | Bundled with Flutter |
| IDE | Android Studio, VS Code, or Cursor with Flutter |
| Java | 17 (Android builds; desugaring enabled) |
| Git | Clone and version control |
| iOS | macOS + Xcode for device/simulator |

Phase 1 does not need a backend.

## Installation

```bash
cd slow-journey
flutter pub get
cp .env.example .env
```

## Environment

`main.dart` loads `.env` at startup. See [Environment variables](./environment.md).

## Run

```bash
flutter run
flutter run --debug
flutter run --release
```

After Drift table changes:

```bash
dart run build_runner build --delete-conflicting-outputs
```

## Build

```bash
flutter build apk --release
flutter build appbundle --release
flutter build ios --release
```

## Quality gates

```bash
flutter analyze   # must print: No issues found!
flutter test
```

If UI copy changed: update `lib/l10n/app_en.arb` and run `flutter gen-l10n`.

Android photo crop uses uCrop (`UCropActivity` in `AndroidManifest.xml`). After adding it, do a full app rebuild rather than a hot reload.

After replacing `assets/brand/app_icon.png`:

```bash
dart run flutter_launcher_icons
```

## Related

| Doc | Topic |
|-----|--------|
| [Naming](./naming.md) | Meaningful names |
| [Localization](./localization.md) | English ARB |
| [Testing](./testing.md) | Test layout |
| [`.cursor/skills/slow-journey-project/SKILL.md`](../../.cursor/skills/slow-journey-project/SKILL.md) | Agent conventions |
