import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../../core/components/journey_widgets.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_theme.dart';
import '../../core/utils/app_date.dart';
import '../../core/utils/l10n_util.dart';

enum PlannerCalendarMode { week, month }

class PlannerCalendar extends StatelessWidget {
  const PlannerCalendar({
    super.key,
    required this.selected,
    required this.mode,
    required this.completedIsoDates,
    required this.onSelect,
    required this.onModeChanged,
  });

  final DateTime selected;
  final PlannerCalendarMode mode;
  final Set<String> completedIsoDates;
  final ValueChanged<DateTime> onSelect;
  final ValueChanged<PlannerCalendarMode> onModeChanged;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final today = AppDate.dateOnly(DateTime.now());
    final showingToday = AppDate.isSameDay(selected, today);
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: SegmentedButton<PlannerCalendarMode>(
                showSelectedIcon: false,
                segments: [
                  ButtonSegment(
                    value: PlannerCalendarMode.week,
                    label: Text(l10n.plannerWeek),
                  ),
                  ButtonSegment(
                    value: PlannerCalendarMode.month,
                    label: Text(l10n.plannerMonth),
                  ),
                ],
                selected: {mode},
                onSelectionChanged: (selection) {
                  HapticFeedback.selectionClick();
                  onModeChanged(selection.first);
                },
              ),
            ),
            if (!showingToday) ...[
              const SizedBox(width: 8),
              TextButton(
                onPressed: () {
                  HapticFeedback.selectionClick();
                  onSelect(today);
                },
                child: Text(l10n.plannerJumpToToday),
              ),
            ],
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            IconButton(
              tooltip: l10n.plannerPrevious,
              onPressed: () {
                HapticFeedback.selectionClick();
                onSelect(
                  mode == PlannerCalendarMode.month
                      ? AppDate.shiftMonths(selected, -1)
                      : AppDate.shiftWeeks(selected, -1),
                );
              },
              icon: const Icon(Icons.chevron_left),
            ),
            Expanded(
              child: TextButton(
                onPressed: () => _pickDate(context),
                child: Text(
                  mode == PlannerCalendarMode.month
                      ? AppDate.monthLabel(selected)
                      : AppDate.weekRangeLabel(selected),
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),
            IconButton(
              tooltip: l10n.plannerPickDate,
              onPressed: () => _pickDate(context),
              icon: const Icon(Icons.calendar_today_outlined),
            ),
            IconButton(
              tooltip: l10n.plannerNext,
              onPressed: () {
                HapticFeedback.selectionClick();
                onSelect(
                  mode == PlannerCalendarMode.month
                      ? AppDate.shiftMonths(selected, 1)
                      : AppDate.shiftWeeks(selected, 1),
                );
              },
              icon: const Icon(Icons.chevron_right),
            ),
          ],
        ),
        const SizedBox(height: 4),
        if (mode == PlannerCalendarMode.week)
          DayStrip(
            selected: selected,
            completedIsoDates: completedIsoDates,
            onSelect: onSelect,
          )
        else
          _MonthGrid(
            selected: selected,
            completedIsoDates: completedIsoDates,
            onSelect: onSelect,
          ),
      ],
    );
  }

  Future<void> _pickDate(BuildContext context) async {
    final l10n = context.l10n;
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      helpText: l10n.plannerPickDate,
      initialDate: selected,
      firstDate: DateTime(now.year - 8),
      lastDate: DateTime(now.year + 1, 12, 31),
    );
    if (picked == null) return;
    HapticFeedback.selectionClick();
    onSelect(AppDate.dateOnly(picked));
  }
}

class _MonthGrid extends StatelessWidget {
  const _MonthGrid({
    required this.selected,
    required this.completedIsoDates,
    required this.onSelect,
  });

  final DateTime selected;
  final Set<String> completedIsoDates;
  final ValueChanged<DateTime> onSelect;

  @override
  Widget build(BuildContext context) {
    final days = AppDate.monthGrid(selected);
    final weekdayLabels = [
      for (final weekday in AppDate.weekContaining(selected))
        DateFormat('EEEEE').format(weekday),
    ];
    return Column(
      children: [
        Row(
          children: [
            for (final label in weekdayLabels)
              Expanded(
                child: Text(
                  label,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: AppTheme.nunito,
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).textTheme.bodySmall?.color,
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 8),
        for (var weekStart = 0; weekStart < days.length; weekStart += 7) ...[
          if (weekStart > 0) const SizedBox(height: 6),
          Row(
            children: [
              for (final day in days.sublist(weekStart, weekStart + 7))
                Expanded(
                  child: _MonthDay(
                    day: day,
                    selected: selected,
                    inMonth: AppDate.isSameMonth(day, selected),
                    completed: completedIsoDates.contains(AppDate.isoDate(day)),
                    onSelect: onSelect,
                  ),
                ),
            ],
          ),
        ],
      ],
    );
  }
}

class _MonthDay extends StatelessWidget {
  const _MonthDay({
    required this.day,
    required this.selected,
    required this.inMonth,
    required this.completed,
    required this.onSelect,
  });

  final DateTime day;
  final DateTime selected;
  final bool inMonth;
  final bool completed;
  final ValueChanged<DateTime> onSelect;

  @override
  Widget build(BuildContext context) {
    final isSelected = AppDate.isSameDay(day, selected);
    final isToday = AppDate.isSameDay(day, DateTime.now());
    final ink = Theme.of(context).colorScheme.onSurface;
    return GestureDetector(
      onTap: () {
        HapticFeedback.selectionClick();
        onSelect(day);
      },
      child: Column(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 220),
            width: 36,
            height: 36,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: isSelected ? context.sjAccent : Colors.transparent,
              shape: BoxShape.circle,
              border: isToday && !isSelected
                  ? Border.all(color: context.sjAccentSoft)
                  : null,
            ),
            child: Text(
              '${day.day}',
              style: TextStyle(
                fontFamily: AppTheme.nunito,
                fontWeight: FontWeight.w700,
                color: isSelected
                    ? context.sjOnAccent
                    : ink.withValues(alpha: inMonth ? 1 : 0.38),
              ),
            ),
          ),
          const SizedBox(height: 4),
          Container(
            width: 5,
            height: 5,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: completed ? context.sjAccentSoft : Colors.transparent,
            ),
          ),
        ],
      ),
    );
  }
}
