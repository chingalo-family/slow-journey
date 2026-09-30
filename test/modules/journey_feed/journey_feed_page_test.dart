import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:slowjourney/app_state/app_state.dart';
import 'package:slowjourney/core/offline_db/app_database.dart';
import 'package:slowjourney/core/services/journey_repository.dart';
import 'package:slowjourney/l10n/app_localizations.dart';
import 'package:slowjourney/modules/journey_feed/journey_feed_page.dart';

import '../../helpers/l10n_harness.dart';
import '../../helpers/test_database.dart';

void main() {
  late AppDatabase database;

  setUp(() async {
    database = await createTestDatabase();
  });

  tearDown(() async {
    await database.close();
  });

  testWidgets(
    'empty feed invitation scrolls instead of overflowing in landscape',
    (tester) async {
      tester.view.physicalSize = const Size(844, 390);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      final l10n = lookupAppLocalizations(const Locale('en'));
      await tester.pumpWidget(
        wrapWithEnglishL10n(
          ChangeNotifierProvider(
            create: (_) => JourneyFeedState(JourneyRepository(database)),
            child: const JourneyFeedPage(),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(tester.takeException(), isNull);
      expect(find.text(l10n.firstReflectionTonight), findsOneWidget);
      expect(find.text(l10n.emptyFeedHint), findsOneWidget);
      expect(find.byType(SingleChildScrollView), findsOneWidget);
    },
  );
}
