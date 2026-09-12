# Offline Storage

All journey data is persisted locally in SQLite so the app works without network. Business rows carry `syncStatus` (`synced` / `notSynced`) for Phase 2 upload. Phase 1 writes `notSynced` and never uploads.

How writes reach these tables: [app flows](../diagrams/app-flows.md) and [code structure](../diagrams/code-structure.md).

## Stack

| Piece | Location |
|-------|----------|
| **ORM** | [Drift](https://drift.simonbinder.eu/) (`AppDatabase`) |
| **Native bindings** | `sqlite3` + `sqlite3_flutter_libs` |
| **DB file** | `slow_journey_app_db.db` |
| **Connection** | `lib/core/offline_db/connection/native.dart` |
| **Path** | `lib/core/offline_db/database_path.dart` |
| **Schema** | `lib/core/offline_db/tables/` |
| **Migrations** | `lib/core/offline_db/offline_database_migrations.dart` |
| **Access** | `JourneyRepository` → `AppDatabase` |

```
UI / State → JourneyRepository → AppDatabase (Drift) → SQLite file
```

Domain models live in `lib/models/`. The repository maps Drift rows to those models.

## Database file

- **Filename:** `slow_journey_app_db.db`
- **Path:** application documents directory (`getApplicationDocumentsDirectory`)
- **Singleton:** `AppDatabase.instance`
- **Tests:** `AppDatabase.createTestDatabase()` / `test/helpers/test_database.dart`

## Schema version and migrations

Schema version is **derived** from the migration list (not hardcoded):

```dart
int get offlineDatabaseSchemaVersion => offlineDatabaseMigrations.length + 1;
```

| Version | Change |
|---------|--------|
| 1 | Full schema via `onCreate` (`createAll` + indexes) |
| 2 | `usage_counter` and `learning_tag_count` tables |
| 3 | `photoPath` on `reflection` |
| 4 | Indexes on intention date, unique reflection (profile, date), key learning |

Current version: **4** (three upgrade steps after the base schema).

### Adding a migration

1. Append a step to `offlineDatabaseMigrations`
2. Update the matching file in `tables/`
3. Run `dart run build_runner build --delete-conflicting-outputs`
4. Do not edit a manual version number

## Tables

| Table | Purpose | Notes |
|-------|---------|--------|
| `profile` | Device-local person (name, optional email/birthday, theme, PIN hash) | UUID `id` |
| `intention` | Up to three aims per profile + `for_date` | `position` 1–3 |
| `reflection` | One evening ritual per profile + date | Unique index |
| `key_learning` | Tag labels on a reflection | Stored IDs stay English |
| `usage_counter` | Streaks, reflection totals, app opens | PK `profile_id` |
| `learning_tag_count` | Per-tag totals for Growth | PK `(profile_id, label)` |
| `insight` | Monthly narrative body | Period key `yyyy-MM` |
| `app_log` | Local diagnostics | Not a sync candidate |

## Invariants

- Max **3** intentions per profile and date
- **One** reflection per profile and date
- **Complete Day** writes reflection, tags, and usage counters in **one transaction**
- Current streak uses consecutive completed reflection dates (`StreakCalculator`)
- Do not rename persisted columns for style

Agent skill: `.cursor/skills/slow-journey-offline/SKILL.md`.
