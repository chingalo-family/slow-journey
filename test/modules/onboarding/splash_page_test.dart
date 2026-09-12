import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:slowjourney/core/components/brand_marks.dart';
import 'package:slowjourney/core/constants/app_colors.dart';
import 'package:slowjourney/l10n/app_localizations.dart';
import 'package:slowjourney/modules/onboarding/splash_page.dart';

import '../../helpers/l10n_harness.dart';

void main() {
  testWidgets('splash shows Slow Journey and the tagline on cream', (
    tester,
  ) async {
    final l10n = lookupAppLocalizations(const Locale('en'));
    await tester.pumpWidget(wrapWithEnglishL10n(const SplashPage()));
    await tester.pump(const Duration(milliseconds: 1400));
    expect(find.text(l10n.appName), findsOneWidget);
    expect(find.text(l10n.tagline.toUpperCase()), findsOneWidget);
    expect(find.byType(LeafMark), findsOneWidget);
    expect(
      tester.widget<Scaffold>(find.byType(Scaffold)).backgroundColor,
      AppColors.creamBg,
    );
    await tester.pumpAndSettle();
  });
}
