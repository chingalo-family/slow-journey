import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_colors.dart';

class AppTheme {
  static const nunito = 'Nunito';
  static const fraunces = 'Fraunces';

  static ThemeData light() {
    final base = ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      fontFamily: nunito,
      scaffoldBackgroundColor: AppColors.creamBg,
      colorScheme: const ColorScheme.light(
        primary: AppColors.sagePrimary,
        onPrimary: Colors.white,
        secondary: AppColors.accentOlive,
        surface: AppColors.creamSurface,
        onSurface: AppColors.ink900,
        error: AppColors.error,
      ),
    );
    return _withCommon(base, dark: false);
  }

  static ThemeData dark() {
    final base = ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      fontFamily: nunito,
      scaffoldBackgroundColor: AppColors.darkBg,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.darkPrimary,
        onPrimary: AppColors.darkBg,
        secondary: AppColors.sagePrimarySoft,
        surface: AppColors.darkSurface,
        onSurface: AppColors.darkText,
        error: AppColors.error,
      ),
    );
    return _withCommon(base, dark: true);
  }

  static ThemeData _withCommon(ThemeData base, {required bool dark}) {
    final ink = dark ? AppColors.darkText : AppColors.ink900;
    final muted = dark ? AppColors.darkTextSecondary : AppColors.ink600;
    final hint = dark ? AppColors.darkNavIdle : AppColors.ink300;
    final surface = dark ? AppColors.darkSurface : AppColors.creamSurface;
    final overlay = dark ? AppColors.darkBg : AppColors.creamBg;
    final accent = dark ? AppColors.darkPrimary : AppColors.sagePrimaryDark;
    final onAccent = dark ? AppColors.darkBg : Colors.white;

    return base.copyWith(
      appBarTheme: AppBarTheme(
        backgroundColor: overlay,
        foregroundColor: ink,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        systemOverlayStyle: dark
            ? SystemUiOverlayStyle.light
            : SystemUiOverlayStyle.dark,
        titleTextStyle: TextStyle(
          fontFamily: nunito,
          fontSize: 17,
          letterSpacing: 0.1,
          fontWeight: FontWeight.w700,
          color: ink,
        ),
      ),
      textTheme: _textTheme(ink, muted, hint),
      cardTheme: CardThemeData(
        color: surface,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: dark ? AppColors.darkInputFill : Colors.white,
        hintStyle: TextStyle(color: hint, fontSize: 15, height: 1.45),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 16,
        ),
        prefixIconColor: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide(color: accent, width: 1.4),
        ),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: AppColors.mistChip,
        selectedColor: AppColors.mistChip,
        disabledColor: AppColors.mistChip,
        labelStyle: const TextStyle(
          fontFamily: nunito,
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: AppColors.ink600,
        ),
        side: BorderSide.none,
        padding: const EdgeInsets.symmetric(horizontal: 4),
      ),
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return dark ? AppColors.darkPrimary : AppColors.sagePrimary;
          }
          return null;
        }),
        trackColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return (dark ? AppColors.darkPrimary : AppColors.sagePrimary)
                .withValues(alpha: 0.45);
          }
          return null;
        }),
      ),
      segmentedButtonTheme: SegmentedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return accent;
            }
            return dark ? AppColors.darkSurface : AppColors.creamSurface;
          }),
          foregroundColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return onAccent;
            }
            return ink;
          }),
          side: WidgetStatePropertyAll(
            BorderSide(color: dark ? AppColors.darkHairline : AppColors.creamHairline),
          ),
        ),
      ),
      dividerColor: dark ? AppColors.darkHairline : AppColors.creamHairline,
      dividerTheme: DividerThemeData(
        color: dark ? AppColors.darkHairline : AppColors.creamHairline,
        thickness: 1,
        space: 1,
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: accent,
        contentTextStyle: TextStyle(color: onAccent, fontFamily: nunito),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
    );
  }

  static TextTheme get mistTextTheme =>
      _textTheme(AppColors.ink900, AppColors.ink600, AppColors.ink300);

  static TextTheme _textTheme(Color ink, Color muted, Color hint) {
    return TextTheme(
      displayLarge: TextStyle(
        fontFamily: fraunces,
        fontSize: 34,
        height: 1.2,
        fontWeight: FontWeight.w500,
        color: ink,
        fontVariations: const [FontVariation('wght', 500)],
      ),
      displayMedium: TextStyle(
        fontFamily: fraunces,
        fontSize: 28,
        height: 1.21,
        fontWeight: FontWeight.w500,
        color: ink,
        fontVariations: const [FontVariation('wght', 500)],
      ),
      headlineLarge: TextStyle(
        fontFamily: fraunces,
        fontSize: 22,
        height: 1.27,
        fontWeight: FontWeight.w600,
        color: ink,
        fontVariations: const [FontVariation('wght', 600)],
      ),
      headlineMedium: TextStyle(
        fontFamily: fraunces,
        fontSize: 18,
        height: 1.33,
        fontWeight: FontWeight.w600,
        color: ink,
        fontVariations: const [FontVariation('wght', 600)],
      ),
      titleLarge: TextStyle(
        fontFamily: nunito,
        fontSize: 18,
        height: 1.3,
        fontWeight: FontWeight.w700,
        color: ink,
        fontVariations: const [FontVariation('wght', 700)],
      ),
      titleMedium: TextStyle(
        fontFamily: nunito,
        fontSize: 15,
        height: 1.4,
        fontWeight: FontWeight.w700,
        color: ink,
        fontVariations: const [FontVariation('wght', 700)],
      ),
      bodyLarge: TextStyle(
        fontFamily: nunito,
        fontSize: 15,
        height: 1.47,
        fontWeight: FontWeight.w400,
        color: ink,
      ),
      bodyMedium: TextStyle(
        fontFamily: nunito,
        fontSize: 15,
        height: 1.47,
        color: muted,
      ),
      bodySmall: TextStyle(
        fontFamily: nunito,
        fontSize: 13,
        height: 1.38,
        color: hint,
      ),
      labelLarge: TextStyle(
        fontFamily: nunito,
        fontSize: 15,
        fontWeight: FontWeight.w700,
        color: ink,
        fontVariations: const [FontVariation('wght', 700)],
      ),
      labelSmall: TextStyle(
        fontFamily: nunito,
        fontSize: 11,
        letterSpacing: 1.4,
        fontWeight: FontWeight.w600,
        color: muted,
        fontVariations: const [FontVariation('wght', 600)],
      ),
    );
  }
}
