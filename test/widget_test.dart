import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:slowjourney/l10n/app_localizations.dart';

void main() {
  test('app ships as Slow Journey', () {
    final l10n = lookupAppLocalizations(const Locale('en'));
    expect(l10n.appName, 'Slow Journey');
    expect(l10n.tagline, 'Pause · Reflect · Grow');
  });
}
