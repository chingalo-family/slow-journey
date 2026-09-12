---
name: slow-journey-offline
description: Keeps Slow Journey offline Drift/SQLite storage, usage counters, streak logic, and reserved syncStatus aligned. Use when changing offline tables, migrations, AppDatabase, JourneyRepository, or on-device stats.
---

# Slow Journey Offline Skill

Local SQLite (Drift) is the source of truth. There is **no upload** in Phase 1. Still write `syncStatus` so Phase 2 can sync without a breaking migration.

## Surfaces

| Surface | Paths |
|---------|--------|
| Tables | `lib/core/offline_db/tables/` |
| Database | `lib/core/offline_db/app_database.dart`, `offline_database_migrations.dart` |
| Connection | `lib/core/offline_db/connection/native.dart`, `database_path.dart` |
| Repository | `lib/core/services/journey_repository.dart` |
| Counters / streak | `usage_counter`, `lib/core/utils/streak.dart` |

DB file: `slow_journey_app_db.db`

## Schema rules
- Version is **derived**: `offlineDatabaseSchemaVersion => offlineDatabaseMigrations.length + 1`
- Do **not** hardcode a separate version number
- Append migrations; update matching table files
- After edits: `dart run build_runner build --delete-conflicting-outputs`
- UUID primary keys on business tables
- Default `syncStatus` is `notSynced`

### Tables
`profile`, `intention`, `reflection`, `key_learning`, `usage_counter`, `learning_tag_count`, `insight`, `app_log`

## Phase 1 invariants
- Max 3 intentions per profile + date
- One reflection per profile + date
- Complete Day updates reflection + tags + usage counters in one transaction
- Current streak uses consecutive completed reflection dates (see `StreakCalculator`)
- Incomplete intentions do not carry over punitively
- Tests use `AppDatabase.createTestDatabase()` / `test/helpers/test_database.dart`

Narrative docs: `docs/architecture/offline-storage.md`.

## Workflow — schema change
```
- [ ] Table updated
- [ ] Migration appended
- [ ] Repository / mappers updated
- [ ] dart run build_runner build --delete-conflicting-outputs
- [ ] Tests in test/core/offline_db/ and streak tests
- [ ] git status includes generated app_database.g.dart on purpose
```

## Verification
```bash
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter analyze
flutter test
```

## Anti-patterns
- Hand-editing schema version
- Adding HTTP / DHIS2 / community tables in Phase 1
- Updating counters outside the same transaction as the action
- Dropping `syncStatus` or UUID keys
