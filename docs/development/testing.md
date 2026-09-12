# Testing

The project uses Flutter's built-in test framework. Tests focus on repository behavior, streaks, dates, PIN hashing, session lock policy, reminder clock math, localization, photo crop presets, and a few widgets.

## Running tests

```bash
flutter test
flutter test test/core/offline_db/journey_repository_test.dart
flutter test --coverage
```

## Test layout

```
test/
├── helpers/
│   ├── test_database.dart
│   └── l10n_harness.dart
├── core/
│   ├── offline_db/
│   └── utils/
├── modules/
│   ├── onboarding/
│   ├── planner/
│   └── reflection/
└── widget_test.dart
```

| Area | Examples |
|------|----------|
| Repository | create profile, max three intentions, complete day / streak |
| Utils | `AppDate`, learning tags, PIN hasher, session lock, reminder schedule, l10n |
| Widgets | Daily cycle primer (English delegates via `wrapWithEnglishL10n`) |

Widget tests that show copy must wrap with `test/helpers/l10n_harness.dart`. Drift tests use `AppDatabase.createTestDatabase()`.

## Quality bar

`flutter analyze` must print **No issues found!** Tests describe behavior (`'complete day updates streak and reflection count'`), not `'test1'`.
