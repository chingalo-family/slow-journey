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
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const MorningIntentionsPage()),
              );
            },
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
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const MorningIntentionsPage(),
                            ),
                          );
                        },
                      ),
                    ],
                  )
                : Column(
                    children: [
                      for (final item in daily.intentions)
                        IntentionRow(
                          label: item.text,
                          completed: item.isCompleted,
                          onToggle: () {
                            if (profile == null) return;
                            context.read<DailyState>().toggle(profile.id, item);
                          },
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
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const EveningReflectionPage(),
                  ),
                );
              },
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
                      daily.dayComplete
                          ? l10n.todayCompleteRest
                          : (DayRhythm.momentFor(DateTime.now()) ==
                                  DayMoment.evening
                              ? l10n.waitingEvening
                              : l10n.nextCloseDayBody),
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 14),
                    SjGhostButton(
                      label: daily.dayComplete
                          ? l10n.viewReflection
                          : l10n.startReflection,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const EveningReflectionPage(),
                          ),
                        );
                      },
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
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const EveningReflectionPage()),
      );
    }
  }
}
