import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:slowjourney/core/components/sj_bottom_nav.dart';
import 'package:slowjourney/core/components/sj_side_nav.dart';
import 'package:slowjourney/core/constants/sj_layout.dart';
import 'package:slowjourney/l10n/app_localizations.dart';

import '../../helpers/l10n_harness.dart';

void main() {
  testWidgets('navigation rail shows icon and label for each destination', (
    tester,
  ) async {
    final l10n = lookupAppLocalizations(const Locale('en'));
    var index = 0;
    await tester.pumpWidget(
      wrapWithEnglishL10n(
        Scaffold(
          body: Row(
            children: [
              SjSideNav(
                index: index,
                destinations: [
                  SjNavDestination(
                    icon: Icons.home_outlined,
                    selectedIcon: Icons.home_rounded,
                    label: l10n.navFeed,
                  ),
                  SjNavDestination(
                    icon: Icons.wb_sunny_outlined,
                    selectedIcon: Icons.wb_sunny_rounded,
                    label: l10n.navPlanner,
                  ),
                ],
                onSelect: (selectedIndex) => index = selectedIndex,
              ),
            ],
          ),
        ),
      ),
    );

    expect(find.text(l10n.navFeed), findsOneWidget);
    expect(find.text(l10n.navPlanner), findsOneWidget);
    expect(find.byIcon(Icons.home_rounded), findsOneWidget);
    expect(find.byIcon(Icons.wb_sunny_outlined), findsOneWidget);
    expect(tester.getSize(find.byType(SjSideNav)).width, SjLayout.railWidth);
    await tester.tap(find.text(l10n.navPlanner));
    expect(index, 1);
  });
}
