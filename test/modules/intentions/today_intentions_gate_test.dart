import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:slowjourney/app_state/app_state.dart';
import 'package:slowjourney/core/offline_db/app_database.dart';
import 'package:slowjourney/core/services/journey_repository.dart';
import 'package:slowjourney/core/services/preference_service.dart';
import 'package:slowjourney/core/utils/app_date.dart';
import 'package:slowjourney/core/utils/day_rhythm.dart';
import 'package:slowjourney/l10n/app_localizations.dart';
import 'package:slowjourney/modules/intentions/today_intentions_gate.dart';

import '../../helpers/l10n_harness.dart';
import '../../helpers/test_database.dart';

void main() {
  late AppDatabase database;
  late JourneyRepository repository;
  late ProfileState profileState;
  late DailyState dailyState;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    database = await createTestDatabase();
    repository = JourneyRepository(database);
    final profile = await repository.createProfile(name: 'Amina');
    profileState = ProfileState(
      repo: repository,
      prefs: PreferenceService(await SharedPreferences.getInstance()),
    );
    profileState.profile = profile;
    profileState.loading = false;
    dailyState = DailyState(repository);
  });

  tearDown(() async {
    await database.close();
  });

  testWidgets('opens morning intentions when today has none', (tester) async {
    final l10n = lookupAppLocalizations(const Locale('en'));
    await tester.pumpWidget(_harness(profileState, dailyState));
    await tester.pumpAndSettle();

    expect(find.text(l10n.intentionTodayTitle), findsOneWidget);
    expect(
      find.text(_greetingForNow(l10n, 'Amina')),
      findsOneWidget,
    );
    expect(find.text('feed home'), findsNothing);
  });

  testWidgets('stays on home when today already has intentions', (tester) async {
    final profileId = profileState.profile!.id;
    await repository.setDay(profileId, AppDate.isoDate(), ['Walk slowly']);
    await dailyState.load(profileId);

    await tester.pumpWidget(_harness(profileState, dailyState));
    await tester.pumpAndSettle();

    expect(find.text('feed home'), findsOneWidget);
    expect(find.text('Morning Intentions'), findsNothing);
  });

  testWidgets('stays on home when today is already closed', (tester) async {
    final profileId = profileState.profile!.id;
    await repository.completeDay(
      profileId: profileId,
      date: AppDate.isoDate(),
      learning: 'Rested',
      wins: 'Quiet hour',
      gratitudeScore: 4,
    );
    await dailyState.load(profileId);

    await tester.pumpWidget(_harness(profileState, dailyState));
    await tester.pumpAndSettle();

    expect(find.text('feed home'), findsOneWidget);
    expect(find.text('Morning Intentions'), findsNothing);
  });
}

String _greetingForNow(AppLocalizations l10n, String name) {
  switch (DayRhythm.momentFor(DateTime.now())) {
    case DayMoment.morning:
      return l10n.goodMorningName(name);
    case DayMoment.afternoon:
      return l10n.goodAfternoonName(name);
    case DayMoment.evening:
      return l10n.goodEveningName(name);
  }
}

Widget _harness(ProfileState profileState, DailyState dailyState) {
  return MultiProvider(
    providers: [
      ChangeNotifierProvider<ProfileState>.value(value: profileState),
      ChangeNotifierProvider<DailyState>.value(value: dailyState),
    ],
    child: wrapWithEnglishL10n(
      const TodayIntentionsGate(child: Text('feed home')),
    ),
  );
}
