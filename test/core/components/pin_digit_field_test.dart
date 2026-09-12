import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:slowjourney/core/components/pin_digit_field.dart';
import 'package:slowjourney/core/utils/pin_hasher.dart';

import '../../helpers/l10n_harness.dart';

void main() {
  testWidgets('calls onCompleted when the fourth digit is entered', (tester) async {
    String? completed;
    await tester.pumpWidget(
      wrapWithEnglishL10n(
        Scaffold(
          body: PinDigitField(
            autofocus: true,
            onCompleted: (pin) => completed = pin,
          ),
        ),
      ),
    );
    await tester.enterText(find.byType(TextField), '2468');
    await tester.pump();
    expect(completed, '2468');
    expect(PinHasher.isValid(completed!), isTrue);
  });

  testWidgets('does not complete before four digits', (tester) async {
    var completedCount = 0;
    await tester.pumpWidget(
      wrapWithEnglishL10n(
        Scaffold(
          body: PinDigitField(
            onCompleted: (_) => completedCount += 1,
          ),
        ),
      ),
    );
    await tester.enterText(find.byType(TextField), '123');
    await tester.pump();
    expect(completedCount, 0);
  });
}
