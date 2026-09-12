import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:slowjourney/core/constants/app_colors.dart';
import 'package:slowjourney/core/constants/app_theme.dart';

void main() {
  testWidgets('dark theme uses forest canvas and light sage accents', (tester) async {
    late BuildContext captured;
    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.dark(),
        home: Builder(
          builder: (context) {
            captured = context;
            return const SizedBox.shrink();
          },
        ),
      ),
    );

    expect(Theme.of(captured).scaffoldBackgroundColor, AppColors.darkBg);
    expect(captured.sjAccent, AppColors.darkPrimary);
    expect(captured.sjNavIdle, AppColors.darkNavIdle);
    expect(Theme.of(captured).chipTheme.backgroundColor, AppColors.mistChip);
    expect(Theme.of(captured).chipTheme.labelStyle?.color, AppColors.ink600);
  });

  testWidgets('light theme keeps sage-on-cream accents', (tester) async {
    late BuildContext captured;
    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.light(),
        home: Builder(
          builder: (context) {
            captured = context;
            return const SizedBox.shrink();
          },
        ),
      ),
    );

    expect(Theme.of(captured).scaffoldBackgroundColor, AppColors.creamBg);
    expect(captured.sjAccent, AppColors.sagePrimaryDark);
    expect(captured.sjHairline, AppColors.creamHairline);
    expect(Theme.of(captured).dividerColor, AppColors.creamHairline);
    expect(Theme.of(captured).chipTheme.backgroundColor, AppColors.mistChip);
  });
}
