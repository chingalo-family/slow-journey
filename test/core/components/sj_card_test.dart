import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:slowjourney/core/components/sj_buttons.dart';
import 'package:slowjourney/core/constants/app_colors.dart';
import 'package:slowjourney/core/constants/app_theme.dart';

void main() {
  testWidgets('mist cards stay cream-sage in light theme', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.light(),
        home: const Scaffold(
          body: SjCard(mist: true, child: Text('Rest')),
        ),
      ),
    );
    expect(_cardSurface(tester), AppColors.mistChip);
  });

  testWidgets('mist cards use the forest surface in dark theme', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.dark(),
        home: const Scaffold(
          body: SjCard(mist: true, child: Text('Rest')),
        ),
      ),
    );
    expect(_cardSurface(tester), AppColors.darkSurface);
  });
}

Color? _cardSurface(WidgetTester tester) {
  return tester
      .widget<Material>(
        find.descendant(
          of: find.byType(SjCard),
          matching: find.byType(Material),
        ).first,
      )
      .color;
}
