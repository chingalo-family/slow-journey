import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:slowjourney/l10n/app_localizations.dart';
import 'package:slowjourney/modules/onboarding/daily_cycle_page.dart';

import '../../helpers/l10n_harness.dart';

void main() {
  testWidgets('daily cycle primer invites Get Started', (tester) async {
    final l10n = lookupAppLocalizations(const Locale('en'));
    await tester.pumpWidget(wrapWithEnglishL10n(const DailyCyclePage()));
    expect(find.text(l10n.yourDailyCycle), findsOneWidget);
    expect(find.text(l10n.getStarted), findsOneWidget);
  });
}
