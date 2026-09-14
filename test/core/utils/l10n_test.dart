import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:slowjourney/core/utils/l10n_util.dart';
import 'package:slowjourney/l10n/app_localizations.dart';

void main() {
  test('English catalog ships Slow Journey labels', () {
    final l10n = L10nUtil.english();
    expect(l10n.appName, 'Slow Journey');
    expect(l10n.tagline, 'Pause · Reflect · Grow');
    expect(l10n.getStarted, 'Get Started');
    expect(l10n.completeDay, 'Complete Day');
    expect(l10n.reflectionThemes, 'Themes');
    expect(l10n.welcomeBackName('Joseph'), 'Welcome back, Joseph');
    expect(l10n.enterLocalPin, 'Enter your four-digit PIN to continue.');
  });

  test('learning tag ids map to English display labels', () {
    final l10n = lookupAppLocalizations(const Locale('en'));
    expect(L10nUtil.learningTagLabel(l10n, 'Mindfulness'), 'Mindfulness');
    expect(L10nUtil.learningTagLabel(l10n, 'Presence'), 'Presence');
  });

  test('feed card dates say today, yesterday, or the weekday', () {
    final l10n = L10nUtil.english();
    final now = DateTime(2026, 9, 11, 8);
    expect(
      L10nUtil.feedCardDate(l10n, DateTime(2026, 9, 11), now),
      'Today · Friday',
    );
    expect(
      L10nUtil.feedCardDate(l10n, DateTime(2026, 9, 10), now),
      'Yesterday · Thursday',
    );
    expect(
      L10nUtil.feedCardDate(l10n, DateTime(2026, 9, 4), now),
      'Friday · Sep 4',
    );
  });
}
