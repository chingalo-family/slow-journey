import 'package:drift/drift.dart';

class Profiles extends Table {
  @override
  String get tableName => 'profile';

  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get email => text().nullable()();
  TextColumn get birthday => text().nullable()();
  TextColumn get memberSince => text()();
  TextColumn get theme => text().withDefault(const Constant('muted_light'))();
  TextColumn get pinHash => text().nullable()();
  TextColumn get syncStatus => text().withDefault(const Constant('notSynced'))();
  TextColumn get createdAt => text()();
  TextColumn get updatedAt => text()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}
