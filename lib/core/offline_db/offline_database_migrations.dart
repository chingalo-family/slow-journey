import 'package:drift/drift.dart';

import 'app_database.dart';

class OfflineMigration {
  const OfflineMigration({required this.from, required this.migrate});

  final int from;
  final Future<void> Function(Migrator migrator, AppDatabase db) migrate;
}

final List<OfflineMigration> offlineDatabaseMigrations = [
  OfflineMigration(
    from: 1,
    migrate: (m, db) async {
      await m.createTable(db.usageCounters);
      await m.createTable(db.learningTagCounts);
    },
  ),
  OfflineMigration(
    from: 2,
    migrate: (m, db) async {
      await m.addColumn(db.reflections, db.reflections.photoPath);
    },
  ),
  OfflineMigration(
    from: 3,
    migrate: (m, db) async {
      await db.customStatement(
        'CREATE INDEX IF NOT EXISTS idx_intention_profile_date ON intention (profile_id, for_date)',
      );
      await db.customStatement(
        'CREATE UNIQUE INDEX IF NOT EXISTS idx_reflection_profile_date ON reflection (profile_id, for_date)',
      );
      await db.customStatement(
        'CREATE INDEX IF NOT EXISTS idx_key_learning_reflection ON key_learning (reflection_id)',
      );
    },
  ),
];

int get offlineDatabaseSchemaVersion => offlineDatabaseMigrations.length + 1;
