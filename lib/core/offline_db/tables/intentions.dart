import 'package:drift/drift.dart';

class Intentions extends Table {
  @override
  String get tableName => 'intention';

  TextColumn get id => text()();
  TextColumn get profileId => text()();
  TextColumn get forDate => text()();
  TextColumn get body => text()();
  IntColumn get position => integer()();
  IntColumn get isCompleted => integer().withDefault(const Constant(0))();
  TextColumn get completedAt => text().nullable()();
  TextColumn get syncStatus => text().withDefault(const Constant('notSynced'))();
  TextColumn get createdAt => text()();
  TextColumn get updatedAt => text()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}
