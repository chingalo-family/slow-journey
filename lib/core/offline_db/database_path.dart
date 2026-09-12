import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

Future<String> slowJourneyDatabasePath() async {
  final dir = await getApplicationDocumentsDirectory();
  return p.join(dir.path, 'slow_journey_app_db.db');
}

Future<File> slowJourneyDatabaseFile() async {
  return File(await slowJourneyDatabasePath());
}
