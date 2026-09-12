import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:slowjourney/l10n/app_localizations.dart';
import 'package:slowjourney/modules/reflection/day_complete_page.dart';

import '../../helpers/l10n_harness.dart';

void main() {
  testWidgets('day complete rest screen shows streak and continue', (tester) async {
    final l10n = lookupAppLocalizations(const Locale('en'));
    await tester.pumpWidget(wrapWithEnglishL10n(const DayCompletePage(streak: 3)));
    expect(find.text(l10n.dayComplete), findsOneWidget);
    expect(find.text(l10n.todayCompleteRest), findsOneWidget);
    expect(find.text('3'), findsOneWidget);
    expect(find.text(l10n.nDayStreak(3)), findsOneWidget);
    expect(find.text(l10n.continueAction), findsOneWidget);
  });

  testWidgets(
      'day complete rest screen scrolls instead of overflowing on a short display',
      (tester) async {
    tester.view.physicalSize = const Size(694, 330);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(wrapWithEnglishL10n(const DayCompletePage(streak: 3)));
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull);
    expect(find.byType(SingleChildScrollView), findsOneWidget);
  });
}
