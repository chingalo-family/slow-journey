import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:slowjourney/core/components/brand_marks.dart';
import 'package:slowjourney/core/components/sj_journey_photo.dart';
import 'package:slowjourney/l10n/app_localizations.dart';

import '../../helpers/l10n_harness.dart';

void main() {
  testWidgets('empty reflection photo slot invites adding a photo', (tester) async {
    final l10n = lookupAppLocalizations(const Locale('en'));
    await tester.pumpWidget(
      wrapWithEnglishL10n(
        Scaffold(
          body: SjJourneyPhoto(
            photoPath: null,
            kind: SjJourneyPhotoKind.slot,
            onTap: () {},
          ),
        ),
      ),
    );
    expect(find.text(l10n.addAPhoto), findsOneWidget);
    expect(find.byIcon(Icons.add_a_photo_outlined), findsOneWidget);
  });

  testWidgets('feed photo without a file shows the leaf placeholder', (tester) async {
    await tester.pumpWidget(
      wrapWithEnglishL10n(
        const Scaffold(
          body: SjJourneyPhoto(
            photoPath: null,
            kind: SjJourneyPhotoKind.feed,
          ),
        ),
      ),
    );
    expect(find.byType(AspectRatio), findsNothing);
    expect(find.byType(LeafMark), findsOneWidget);
  });
}
