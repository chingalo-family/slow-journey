import 'package:flutter/material.dart';
import 'package:slowjourney/core/constants/app_theme.dart';
import 'package:slowjourney/l10n/app_localizations.dart';

Widget wrapWithEnglishL10n(Widget home) {
  return MaterialApp(
    locale: const Locale('en'),
    supportedLocales: AppLocalizations.supportedLocales,
    localizationsDelegates: AppLocalizations.localizationsDelegates,
    theme: AppTheme.light(),
    home: home,
  );
}
