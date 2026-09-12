import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_state/app_state.dart';
import 'core/offline_db/app_database.dart';
import 'core/services/journey_repository.dart';
import 'core/services/local_notification_service.dart';
import 'core/services/photo_capture_service.dart';
import 'core/services/preference_service.dart';
import 'my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');

  final notifications = LocalNotificationService();
  await notifications.initialize();

  final prefs = PreferenceService(await SharedPreferences.getInstance());
  final db = AppDatabase.instance;
  final repo = JourneyRepository(db);
  await notifications.syncFromPreferences(prefs);

  runApp(
    MultiProvider(
      providers: [
        Provider<AppDatabase>.value(value: db),
        Provider<JourneyRepository>.value(value: repo),
        Provider<PhotoCaptureService>.value(value: PhotoCaptureService(repo)),
        Provider<PreferenceService>.value(value: prefs),
        Provider<LocalNotificationService>.value(value: notifications),
        ChangeNotifierProvider(
          create: (_) => ProfileState(repo: repo, prefs: prefs),
        ),
        ChangeNotifierProvider(
          create: (_) => SettingsState(prefs: prefs, notifications: notifications),
        ),
        ChangeNotifierProvider(create: (_) => DailyState(repo)),
        ChangeNotifierProvider(create: (_) => JourneyFeedState(repo)),
        ChangeNotifierProvider(create: (_) => GrowthState(repo)),
      ],
      child: const MyApp(),
    ),
  );
}
