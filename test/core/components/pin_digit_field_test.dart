import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:slowjourney/core/components/pin_digit_field.dart';
import 'package:slowjourney/core/components/pin_on_screen_keypad.dart';
import 'package:slowjourney/core/utils/pin_hasher.dart';

import '../../helpers/l10n_harness.dart';

void main() {
  testWidgets('calls onCompleted when the fourth digit is entered', (
    tester,
  ) async {
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
        Scaffold(body: PinDigitField(onCompleted: (_) => completedCount += 1)),
      ),
    );
    await tester.enterText(find.byType(TextField), '123');
    await tester.pump();
    expect(completedCount, 0);
  });

  testWidgets('on-screen keypad completes after four digits', (tester) async {
    String? completed;
    final pinEntry = PinEntryController();
    addTearDown(pinEntry.dispose);
    await tester.pumpWidget(
      wrapWithEnglishL10n(
        Scaffold(
          body: Column(
            children: [
              PinDigitField(
                controller: pinEntry,
                useSystemKeyboard: false,
                onCompleted: (pin) => completed = pin,
              ),
              PinOnScreenKeypad(
                onDigitPressed: pinEntry.appendDigit,
                onBackspacePressed: pinEntry.deleteLastDigit,
              ),
            ],
          ),
        ),
      ),
    );
    expect(find.byType(TextField), findsNothing);
    await tester.tap(find.byKey(const ValueKey('pin-key-2')));
    await tester.tap(find.byKey(const ValueKey('pin-key-4')));
    await tester.tap(find.byKey(const ValueKey('pin-key-6')));
    await tester.pump();
    expect(completed, isNull);
    await tester.tap(find.byKey(const ValueKey('pin-key-8')));
    await tester.pump();
    expect(completed, '2468');
  });

  testWidgets('on-screen keypad backspace removes the last digit', (
    tester,
  ) async {
    String? completed;
    final pinEntry = PinEntryController();
    addTearDown(pinEntry.dispose);
    await tester.pumpWidget(
      wrapWithEnglishL10n(
        Scaffold(
          body: Column(
            children: [
              PinDigitField(
                controller: pinEntry,
                useSystemKeyboard: false,
                onCompleted: (pin) => completed = pin,
              ),
              PinOnScreenKeypad(
                onDigitPressed: pinEntry.appendDigit,
                onBackspacePressed: pinEntry.deleteLastDigit,
              ),
            ],
          ),
        ),
      ),
    );
    await tester.tap(find.byKey(const ValueKey('pin-key-1')));
    await tester.tap(find.byKey(const ValueKey('pin-key-2')));
    await tester.tap(find.byKey(const ValueKey('pin-key-3')));
    await tester.tap(find.byKey(const ValueKey('pin-key-backspace')));
    await tester.tap(find.byKey(const ValueKey('pin-key-9')));
    await tester.tap(find.byKey(const ValueKey('pin-key-8')));
    await tester.pump();
    expect(completed, '1298');
  });
}
