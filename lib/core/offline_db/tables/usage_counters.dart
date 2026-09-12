import 'package:drift/drift.dart';

class UsageCounters extends Table {
  @override
  String get tableName => 'usage_counter';

  TextColumn get profileId => text()();
  IntColumn get totalReflections => integer().withDefault(const Constant(0))();
  IntColumn get currentStreak => integer().withDefault(const Constant(0))();
  IntColumn get longestStreak => integer().withDefault(const Constant(0))();
  IntColumn get intentionsSetCount => integer().withDefault(const Constant(0))();
  IntColumn get intentionsCompletedCount =>
      integer().withDefault(const Constant(0))();
  IntColumn get daysCompleted => integer().withDefault(const Constant(0))();
  IntColumn get appOpenCount => integer().withDefault(const Constant(0))();
  TextColumn get lastActiveDate => text()();
  TextColumn get updatedAt => text()();
  TextColumn get syncStatus => text().withDefault(const Constant('notSynced'))();

  @override
  Set<Column<Object>> get primaryKey => {profileId};
}

class LearningTagCounts extends Table {
  @override
  String get tableName => 'learning_tag_count';

  TextColumn get profileId => text()();
  TextColumn get label => text()();
  IntColumn get count => integer().withDefault(const Constant(0))();

  @override
  Set<Column<Object>> get primaryKey => {profileId, label};
}
