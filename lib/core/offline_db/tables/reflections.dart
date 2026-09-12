import 'package:drift/drift.dart';

class Reflections extends Table {
  @override
  String get tableName => 'reflection';

  TextColumn get id => text()();
  TextColumn get profileId => text()();
  TextColumn get forDate => text()();
  TextColumn get title => text().nullable()();
  TextColumn get learning => text()();
  TextColumn get wins => text()();
  IntColumn get gratitudeScore => integer()();
  TextColumn get photoPath => text().nullable()();
  TextColumn get syncStatus => text().withDefault(const Constant('notSynced'))();
  TextColumn get createdAt => text()();
  TextColumn get updatedAt => text()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}
