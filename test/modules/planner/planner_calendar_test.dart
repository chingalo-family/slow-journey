import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:slowjourney/l10n/app_localizations.dart';
import 'package:slowjourney/modules/planner/planner_calendar.dart';

import '../../helpers/l10n_harness.dart';

void main() {
  testWidgets('planner calendar pages weeks and can show a month', (tester) async {
    final l10n = lookupAppLocalizations(const Locale('en'));
    var selected = DateTime(2026, 9, 11);
    var mode = PlannerCalendarMode.week;

    await tester.pumpWidget(
      wrapWithEnglishL10n(
        Scaffold(
          body: StatefulBuilder(
            builder: (context, setState) {
              return PlannerCalendar(
                selected: selected,
                mode: mode,
                completedIsoDates: const {},
                onSelect: (day) => setState(() => selected = day),
                onModeChanged: (nextMode) => setState(() => mode = nextMode),
              );
            },
          ),
        ),
      ),
    );

    expect(find.text(l10n.plannerWeek), findsOneWidget);
    expect(find.text('11'), findsWidgets);

    await tester.tap(find.byTooltip(l10n.plannerPrevious));
    await tester.pump();
    expect(selected, DateTime(2026, 9, 4));

    await tester.tap(find.text(l10n.plannerMonth));
    await tester.pump();
    expect(mode, PlannerCalendarMode.month);
    expect(find.text('1'), findsWidgets);
    expect(find.text('30'), findsWidgets);
  });
}
