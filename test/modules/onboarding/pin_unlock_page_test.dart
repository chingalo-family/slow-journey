import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:slowjourney/app_state/app_state.dart';
import 'package:slowjourney/core/components/pin_digit_field.dart';
import 'package:slowjourney/core/components/pin_on_screen_keypad.dart';
import 'package:slowjourney/core/offline_db/app_database.dart';
import 'package:slowjourney/core/services/journey_repository.dart';
import 'package:slowjourney/core/services/preference_service.dart';
import 'package:slowjourney/l10n/app_localizations.dart';
import 'package:slowjourney/modules/onboarding/pin_unlock_page.dart';

import '../../helpers/l10n_harness.dart';
import '../../helpers/test_database.dart';

void main() {
  late AppDatabase database;
  late ProfileState profileState;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    database = await createTestDatabase();
    final repository = JourneyRepository(database);
    await repository.createProfile(name: 'Joseph Chingalo');
    profileState = ProfileState(
      repo: repository,
      prefs: PreferenceService(await SharedPreferences.getInstance()),
    );
    profileState.profile = await repository.loadProfile();
    profileState.loading = false;
    profileState.locked = true;
  });

  tearDown(() async {
    await database.close();
  });

  testWidgets('landscape keeps PIN boxes and keypad on screen', (tester) async {
    tester.view.physicalSize = const Size(844, 390);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    final l10n = lookupAppLocalizations(const Locale('en'));
    await tester.pumpWidget(
      wrapWithEnglishL10n(
        ChangeNotifierProvider.value(
          value: profileState,
          child: const PinUnlockPage(),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(tester.takeException(), isNull);
    expect(find.text(l10n.welcomeBackName('Joseph')), findsOneWidget);
    expect(find.byType(PinDigitField), findsOneWidget);
    expect(find.byType(PinOnScreenKeypad), findsOneWidget);

    final screen = tester.getRect(find.byType(Scaffold));
    expect(screen.overlaps(tester.getRect(find.byType(PinDigitField))), isTrue);
    expect(
      screen.overlaps(tester.getRect(find.byType(PinOnScreenKeypad))),
      isTrue,
    );
  });

  testWidgets('portrait keeps PIN boxes and keypad on a short phone', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(390, 640);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(
      wrapWithEnglishL10n(
        ChangeNotifierProvider.value(
          value: profileState,
          child: const PinUnlockPage(),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(tester.takeException(), isNull);
    final screen = tester.getRect(find.byType(Scaffold));
    expect(screen.overlaps(tester.getRect(find.byType(PinDigitField))), isTrue);
    expect(
      screen.overlaps(tester.getRect(find.byType(PinOnScreenKeypad))),
      isTrue,
    );
  });
}
