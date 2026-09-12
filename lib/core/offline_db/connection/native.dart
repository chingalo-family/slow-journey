import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:sqlite3/sqlite3.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';

import '../database_path.dart';

QueryExecutor openConnection() {
  return LazyDatabase(() async {
    if (Platform.isAndroid) {
      await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
    }
    sqlite3.tempDirectory = (await Directory.systemTemp.exists())
        ? Directory.systemTemp.path
        : p.dirname(await slowJourneyDatabasePath());
    final file = await slowJourneyDatabaseFile();
    return NativeDatabase.createInBackground(file);
  });
}

QueryExecutor openTestConnection() => NativeDatabase.memory();
