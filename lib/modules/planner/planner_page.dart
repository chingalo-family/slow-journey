import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app_state/app_state.dart';
import '../../core/components/journey_widgets.dart';
import '../../core/components/sj_buttons.dart';
import '../../core/components/sj_chrome.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/quote_pack.dart';
import '../../core/constants/sj_layout.dart';
import '../../core/utils/app_date.dart';
import '../../core/utils/day_rhythm.dart';
import '../../core/utils/l10n_util.dart';
import '../../l10n/app_localizations.dart';
import '../intentions/morning_intentions_page.dart';
import '../reflection/evening_reflection_page.dart';
import '../settings/manage_profile_page.dart';
import 'planner_calendar.dart';

class PlannerPage extends StatefulWidget {
  const PlannerPage({super.key});

  @override
  State<PlannerPage> createState() => _PlannerPageState();
}

class _PlannerPageState extends State<PlannerPage> {
  var _calendarMode = PlannerCalendarMode.week;

  Future<void> _openDay(DateTime day, {PlannerCalendarMode? mode}) async {
    final profile = context.read<ProfileState>().profile;
    if (profile == null) return;
    final visibleMode = mode ?? _calendarMode;
    final range = AppDate.plannerVisibleRange(
      day,
      month: visibleMode == PlannerCalendarMode.month,
    );
    await context.read<DailyState>().load(
          profile.id,
          day: day,
          completedRangeStart: range.start,
          completedRangeEnd: range.end,
        );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final daily = context.watch<DailyState>();
    final profile = context.watch<ProfileState>().profile;
    final quote = QuotePack.forDate(daily.selectedDay, l10n);
    final next = daily.nextKind();
    final now = DateTime.now();
    final canEditIntentions = DayRhythm.canEditIntentions(
      selectedDay: daily.selectedDay,
      now: now,
    );
    final canOpenReflection = DayRhythm.canOpenReflection(
      selectedDay: daily.selectedDay,
      now: now,
      dayComplete: daily.dayComplete,
    );
    final first = DayRhythm.firstName(
      profile?.name ?? '',
      l10n.greetingFriend,
    );
    return Scaffold(
      appBar: AppBar(
        leading: SjProfileButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const ManageProfilePage()),
            );
          },
        ),
        title: Column(
          children: [
            Text(l10n.dailyPlanner),
            Text(
              AppDate.plannerHeader(daily.selectedDay),
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
        actions: [
          IconButton(
            tooltip: l10n.editIntentions,
            onPressed: canEditIntentions
                ? () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const MorningIntentionsPage(),
                      ),
                    );
                  }
                : null,
            icon: const Icon(Icons.edit_outlined),
          ),
        ],
      ),
      body: ListView(
        padding: SjLayout.tabBodyPaddingOf(context),
        children: [
          if (AppDate.isSameDay(daily.selectedDay, DateTime.now())) ...[
            Text(
              _greeting(l10n, first),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 14),
          ],
          SjCard(
            padding: const EdgeInsets.fromLTRB(12, 12, 12, 10),
            child: PlannerCalendar(
              selected: daily.selectedDay,
              mode: _calendarMode,
              completedIsoDates: daily.completedIsoDates,
              onSelect: _openDay,
              onModeChanged: (mode) {
                setState(() => _calendarMode = mode);
                _openDay(daily.selectedDay, mode: mode);
              },
            ),
          ),
          const SizedBox(height: 16),
          NextStepCard(
            kind: next,
            onAction: () => _openNext(context, next),
          ),
          const SizedBox(height: 22),
          SjSectionHeader(
            icon: Icons.wb_sunny_outlined,
            title: l10n.morningIntentions,
            trailing: daily.intentions.isEmpty
                ? null
                : Text(
                    l10n.honoredOfThree(
                      daily.honoredCount,
                      daily.intentions.length,
                    ),
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
          ),
          SjCard(
            child: daily.intentions.isEmpty
                ? Column(
                    children: [
                      Text(
                        l10n.noIntentionsYet,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 12),
                      SjGhostButton(
                        label: l10n.setIntentions,
                        onPressed: canEditIntentions
                            ? () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => const MorningIntentionsPage(),
                                  ),
                                );
                              }
                            : null,
                      ),
                    ],
                  )
                : Column(
                    children: [
                      for (final item in daily.intentions)
                        IntentionRow(
                          label: item.text,
                          completed: item.isCompleted,
                          onToggle: canEditIntentions && profile != null
                              ? () {
                                  context
                                      .read<DailyState>()
                                      .toggle(profile.id, item);
                                }
                              : null,
                        ),
                    ],
                  ),
          ),
          const SizedBox(height: 22),
          SjSectionHeader(
            icon: Icons.nightlight_outlined,
            title: l10n.eveningReflection,
          ),
          SjCard(
            mist: true,
            padding: EdgeInsets.zero,
            child: InkWell(
              onTap: canOpenReflection
                  ? () => _openReflection(context)
                  : null,
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  children: [
                    Icon(
                      daily.dayComplete
                          ? Icons.check_circle_outline
                          : Icons.edit_note_outlined,
                      color: AppColors.sagePrimaryDark,
                      size: 28,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      _reflectionHint(
                        l10n,
                        dayComplete: daily.dayComplete,
                        canOpenReflection: canOpenReflection,
                        selectedDay: daily.selectedDay,
                        now: now,
                      ),
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 14),
                    SjGhostButton(
                      label: daily.dayComplete
                          ? l10n.viewReflection
                          : l10n.startReflection,
                      onPressed: canOpenReflection
                          ? () => _openReflection(context)
                          : null,
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          WisdomBanner(quote: quote.body),
        ],
      ),
    );
  }

  String _greeting(AppLocalizations l10n, String first) {
    switch (DayRhythm.momentFor(DateTime.now())) {
      case DayMoment.morning:
        return l10n.goodMorningName(first);
      case DayMoment.afternoon:
        return l10n.goodAfternoonName(first);
      case DayMoment.evening:
        return l10n.goodEveningName(first);
    }
  }

  String _reflectionHint(
    AppLocalizations l10n, {
    required bool dayComplete,
    required bool canOpenReflection,
    required DateTime selectedDay,
    required DateTime now,
  }) {
    if (dayComplete) {
      return AppDate.isSameDay(selectedDay, now)
          ? l10n.todayCompleteRest
          : l10n.nextRestBody;
    }
    if (canOpenReflection) {
      if (AppDate.isSameDay(selectedDay, now) &&
          DayRhythm.momentFor(now) == DayMoment.evening) {
        return l10n.waitingEvening;
      }
      return l10n.nextCloseDayBody;
    }
    if (AppDate.dateOnly(selectedDay).isAfter(AppDate.dateOnly(now))) {
      return l10n.nextFutureBody;
    }
    return l10n.reflectionOpensThisEvening;
  }

  void _openReflection(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const EveningReflectionPage()),
    );
  }

  void _openNext(BuildContext context, DayNextKind kind) {
    if (kind == DayNextKind.setIntentions) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const MorningIntentionsPage()),
      );
      return;
    }
    if (kind == DayNextKind.closeTheDay ||
        kind == DayNextKind.closePastDay ||
        kind == DayNextKind.rest) {
      _openReflection(context);
    }
  }
}
