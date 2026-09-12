import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app_state/app_state.dart';
import '../../core/components/brand_marks.dart';
import '../../core/components/journey_widgets.dart';
import '../../core/components/sj_buttons.dart';
import '../../core/components/sj_chrome.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_theme.dart';
import '../../core/constants/sj_layout.dart';
import '../../core/utils/l10n_util.dart';
import '../settings/manage_profile_page.dart';

class GrowthPage extends StatelessWidget {
  const GrowthPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final growth = context.watch<GrowthState>();
    final counters = growth.counters;
    final tagEntries = growth.tags.entries.toList()
      ..sort((left, right) {
        final byCount = right.value.compareTo(left.value);
        if (byCount != 0) {
          return byCount;
        }
        return left.key.compareTo(right.key);
      });
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
        title: Text(l10n.growthData),
      ),
      body: ListView(
        padding: SjLayout.tabBodyPaddingOf(context),
        children: [
          SjCard(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
            child: Row(
              children: [
                Expanded(
                  child: _StatCell(
                    value: '${counters?.totalReflections ?? 0}',
                    label: l10n.statReflections,
                  ),
                ),
                const _StatDivider(),
                Expanded(
                  child: _StatCell(
                    value: '${counters?.currentStreak ?? 0}',
                    label: l10n.statDayStreak,
                  ),
                ),
                const _StatDivider(),
                Expanded(
                  child: _StatCell(
                    value: '${counters?.longestStreak ?? 0}',
                    label: l10n.statLongest,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 26),
          SjSectionHeader(title: l10n.growthOverview),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              l10n.growthChartCaption,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          SjCard(child: GrowthBars(buckets: growth.buckets)),
          const SizedBox(height: 26),
          SjSectionHeader(title: l10n.keyLearnings),
          SjCard(
            child: tagEntries.isEmpty
                ? Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      l10n.growthEmptyTags,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  )
                : Column(
                    children: [
                      for (var tagIndex = 0;
                          tagIndex < tagEntries.length;
                          tagIndex++) ...[
                        if (tagIndex > 0) const SizedBox(height: 10),
                        _LearningRow(
                          label: L10nUtil.learningTagLabel(
                            l10n,
                            tagEntries[tagIndex].key,
                          ),
                          count: tagEntries[tagIndex].value,
                          strongest: tagIndex == 0,
                        ),
                      ],
                    ],
                  ),
          ),
          const SizedBox(height: 26),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: context.sjBanner,
              borderRadius: BorderRadius.circular(22),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const LeafMark(size: 22, color: Colors.white70),
                    const SizedBox(width: 8),
                    Text(
                      l10n.monthlyInsight.toUpperCase(),
                      style: const TextStyle(
                        fontFamily: AppTheme.nunito,
                        fontSize: 11,
                        letterSpacing: 1.4,
                        color: Colors.white70,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  growth.insight?.body ?? l10n.insightEmpty,
                  style: const TextStyle(
                    fontFamily: AppTheme.fraunces,
                    fontSize: 18,
                    height: 1.4,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _LearningRow extends StatelessWidget {
  const _LearningRow({
    required this.label,
    required this.count,
    required this.strongest,
  });

  final String label;
  final int count;
  final bool strongest;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SjChip(label: label),
        const Spacer(),
        Text(
          context.l10n.growthEveningCount(count),
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontWeight: strongest ? FontWeight.w700 : FontWeight.w600,
                color: strongest ? context.sjAccent : null,
              ),
        ),
      ],
    );
  }
}

class _StatDivider extends StatelessWidget {
  const _StatDivider();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1,
      height: 48,
      color: Theme.of(context).dividerColor,
    );
  }
}

class _StatCell extends StatelessWidget {
  const _StatCell({required this.value, required this.label});

  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: '$value $label',
      child: Column(
        children: [
          Text(value, style: Theme.of(context).textTheme.displayMedium),
          const SizedBox(height: 4),
          Text(
            label,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
