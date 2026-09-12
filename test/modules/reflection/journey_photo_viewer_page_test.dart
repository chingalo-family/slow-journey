import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:slowjourney/l10n/app_localizations.dart';
import 'package:slowjourney/modules/reflection/journey_photo_viewer_page.dart';

import '../../helpers/l10n_harness.dart';

void main() {
  testWidgets('photo viewer pinch-zooms and offers crop when editing', (tester) async {
    final l10n = lookupAppLocalizations(const Locale('en'));
    await tester.pumpWidget(
      wrapWithEnglishL10n(
        JourneyPhotoViewerPage(
          photoPath: '/missing/slow-journey-photo.png',
          onRecrop: () async {},
          onChange: () async {},
        ),
      ),
    );

    expect(find.text(l10n.viewPhoto), findsOneWidget);
    expect(find.byType(InteractiveViewer), findsOneWidget);
    expect(find.text(l10n.cropPhoto), findsOneWidget);
    expect(find.text(l10n.changePhoto), findsOneWidget);
  });
}
