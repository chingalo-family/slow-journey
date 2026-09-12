import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:slowjourney/core/components/journey_widgets.dart';
import 'package:slowjourney/models/models.dart';

import '../../helpers/l10n_harness.dart';

void main() {
  testWidgets('growth bars label each week and show the evening count', (
    tester,
  ) async {
    await tester.pumpWidget(
      wrapWithEnglishL10n(
        const Scaffold(
          body: GrowthBars(
            buckets: [
              ChartBucket(label: 'W35', count: 1),
              ChartBucket(label: 'W36', count: 3),
            ],
          ),
        ),
      ),
    );
    expect(find.text('W35'), findsOneWidget);
    expect(find.text('W36'), findsOneWidget);
    expect(find.text('1'), findsOneWidget);
    expect(find.text('3'), findsOneWidget);
  });

  testWidgets('growth bars invite evenings when there is no chart yet', (
    tester,
  ) async {
    await tester.pumpWidget(
      wrapWithEnglishL10n(
        const Scaffold(body: GrowthBars(buckets: [])),
      ),
    );
    expect(
      find.text('Your weekly shape appears after a few evenings.'),
      findsOneWidget,
    );
  });
}
