import 'package:drift/drift.dart';

class Insights extends Table {
  @override
  String get tableName => 'insight';

  TextColumn get id => text()();
  TextColumn get profileId => text()();
  TextColumn get period => text()();
  TextColumn get body => text()();
  TextColumn get createdAt => text()();
  TextColumn get syncStatus => text().withDefault(const Constant('notSynced'))();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

class AppLogs extends Table {
  @override
  String get tableName => 'app_log';

  TextColumn get id => text()();
  TextColumn get level => text()();
  TextColumn get message => text()();
  TextColumn get createdAt => text()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}
