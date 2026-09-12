import 'package:flutter/material.dart';

class AppColors {
  static const sagePrimary = Color(0xFF7C8B6F);
  static const sagePrimaryDark = Color(0xFF5E6B52);
  static const sagePrimarySoft = Color(0xFFA9B49C);
  static const creamBg = Color(0xFFF4F1EA);
  static const creamSurface = Color(0xFFFBF9F4);
  static const ink900 = Color(0xFF2C2E2A);
  static const ink600 = Color(0xFF5A5D54);
  static const ink300 = Color(0xFF9A9C93);
  static const accentOlive = Color(0xFF6B7A50);
  static const success = Color(0xFF6E8B5A);
  static const warning = Color(0xFFC9A24B);
  static const error = Color(0xFFB4685E);

  static const mistChip = Color(0xFFEEF2E6);
  static const mistPhoto = Color(0xFFD9E2CC);
  static const mistAvatar = Color(0xFFE8EDE1);

  static const darkBg = Color(0xFF1E201C);
  static const darkSurface = Color(0xFF2A2D27);
  static const darkPrimary = Color(0xFF8FA07F);
  static const darkText = Color(0xFFEDEBE3);
  static const darkTextSecondary = Color(0xFFB6B8AD);
  static const darkNavIdle = Color(0xFF8A8C84);
  static const darkBanner = Color(0xFF4A5444);
  static const darkInputFill = Color(0xFF32362F);
  static const darkHairline = Color(0xFF3A3E38);
  static const creamHairline = Color(0xFFD5DCCB);
}

extension SjColors on BuildContext {
  bool get isDarkTheme => Theme.of(this).brightness == Brightness.dark;

  Color get sjAccent =>
      isDarkTheme ? AppColors.darkPrimary : AppColors.sagePrimaryDark;

  Color get sjAccentSoft =>
      isDarkTheme ? AppColors.sagePrimarySoft : AppColors.sagePrimary;

  Color get sjOnAccent =>
      isDarkTheme ? AppColors.darkBg : Colors.white;

  Color get sjNavIdle =>
      isDarkTheme ? AppColors.darkNavIdle : AppColors.ink300;

  Color get sjBanner =>
      isDarkTheme ? AppColors.darkBanner : AppColors.sagePrimaryDark;

  Color get sjInputFill =>
      isDarkTheme ? AppColors.darkInputFill : const Color(0xFFF7F5EF);

  Color get sjHint =>
      isDarkTheme ? AppColors.darkNavIdle : AppColors.ink300;

  Color get sjHairline =>
      isDarkTheme ? AppColors.darkHairline : AppColors.creamHairline;
}
