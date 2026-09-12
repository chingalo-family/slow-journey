import 'package:slowjourney/core/offline_db/app_database.dart';

Future<AppDatabase> createTestDatabase() async {
  final database = AppDatabase.createTestDatabase();
  await database.customSelect('SELECT 1').get();
  return database;
}
