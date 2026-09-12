import 'package:drift/drift.dart';

class KeyLearnings extends Table {
  @override
  String get tableName => 'key_learning';

  TextColumn get id => text()();
  TextColumn get reflectionId => text()();
  TextColumn get label => text()();
  TextColumn get syncStatus => text().withDefault(const Constant('notSynced'))();

  @override
  Set<Column<Object>> get primaryKey => {id};
}
