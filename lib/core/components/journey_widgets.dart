import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import 'package:slowjourney/l10n/app_localizations.dart';

import '../../models/models.dart';
import '../constants/app_colors.dart';
import '../constants/app_theme.dart';
import '../utils/app_date.dart';
import '../utils/day_rhythm.dart';
import '../utils/l10n_util.dart';
import 'sj_buttons.dart';

class DayStrip extends StatelessWidget {
  const DayStrip({
    super.key,
    required this.selected,
    required this.onSelect,
    this.completedIsoDates = const {},
  });

  final DateTime selected;
  final ValueChanged<DateTime> onSelect;
  final Set<String> completedIsoDates;

  @override
  Widget build(BuildContext context) {
    final days = AppDate.weekContaining(selected);
    final muted = Theme.of(context).textTheme.bodySmall?.color;
    return Row(
      children: [
        for (final day in days)
          Expanded(
            child: GestureDetector(
              onTap: () {
                HapticFeedback.selectionClick();
                onSelect(day);
              },
              child: Column(
                children: [
                  Text(
                    DateFormat('EEEEE').format(day),
                    style: TextStyle(
                      fontFamily: AppTheme.nunito,
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: muted,
                    ),
                  ),
                  const SizedBox(height: 8),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 220),
                    width: 36,
                    height: 36,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppDate.isSameDay(day, selected)
                          ? context.sjAccent
                          : Colors.transparent,
                      shape: BoxShape.circle,
                      border: AppDate.isSameDay(day, DateTime.now()) &&
                              !AppDate.isSameDay(day, selected)
                          ? Border.all(color: context.sjAccentSoft)
                          : null,
                    ),
                    child: Text(
                      '${day.day}',
                      style: TextStyle(
                        fontFamily: AppTheme.nunito,
                        fontWeight: FontWeight.w700,
                        color: AppDate.isSameDay(day, selected)
                            ? context.sjOnAccent
                            : Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Container(
                    width: 5,
                    height: 5,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: completedIsoDates.contains(AppDate.isoDate(day))
                          ? context.sjAccentSoft
                          : Colors.transparent,
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}

class IntentionRow extends StatelessWidget {
  const IntentionRow({
    super.key,
    required this.label,
    required this.completed,
    required this.onToggle,
  });

  final String label;
  final bool completed;
  final VoidCallback onToggle;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        HapticFeedback.lightImpact();
        onToggle();
      },
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 22,
              height: 22,
              decoration: BoxDecoration(
                color: completed ? context.sjAccentSoft : Colors.transparent,
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                  color: completed
                      ? context.sjAccentSoft
                      : AppColors.sagePrimarySoft,
                  width: 1.6,
                ),
              ),
              child: completed
                  ? const Icon(Icons.check, size: 14, color: Colors.white)
                  : null,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                label,
                style: TextStyle(
                  fontFamily: AppTheme.nunito,
                  fontSize: 14.5,
                  height: 1.35,
                  decoration:
                      completed ? TextDecoration.lineThrough : TextDecoration.none,
                  color: completed
                      ? context.sjHint
                      : Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GratitudeSelector extends StatelessWidget {
  const GratitudeSelector({
    super.key,
    required this.value,
    required this.onChanged,
  });

  final int value;
  final ValueChanged<int> onChanged;

  static const _faces = [
    Icons.sentiment_dissatisfied_outlined,
    Icons.sentiment_neutral_outlined,
    Icons.sentiment_satisfied_outlined,
    Icons.sentiment_very_satisfied_outlined,
  ];

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final labels = [
      l10n.gratitudeTender,
      l10n.gratitudeSteady,
      l10n.gratitudeGrateful,
      l10n.gratitudeGlowing,
    ];
    return Semantics(
      label: l10n.gratitudeSemantics,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          for (var faceIndex = 0; faceIndex < 4; faceIndex++)
            Semantics(
              button: true,
              selected: value == faceIndex + 1,
              label: l10n.gratitudeOptionLabel(labels[faceIndex], faceIndex + 1),
              child: InkWell(
                customBorder: const CircleBorder(),
                onTap: () {
                  HapticFeedback.selectionClick();
                  onChanged(faceIndex + 1);
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: value == faceIndex + 1
                        ? context.sjAccentSoft
                        : Colors.transparent,
                  ),
                  child: Icon(
                    _faces[faceIndex],
                    color: value == faceIndex + 1
                        ? Colors.white
                        : context.sjHint,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class WisdomBanner extends StatelessWidget {
  const WisdomBanner({super.key, required this.quote});

  final String quote;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(22, 22, 56, 22),
      decoration: BoxDecoration(
        color: context.sjBanner,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.l10n.todaysWisdom.toUpperCase(),
                style: TextStyle(
                  fontFamily: AppTheme.nunito,
                  fontSize: 11,
                  letterSpacing: 1.6,
                  fontWeight: FontWeight.w700,
                  color: Colors.white.withValues(alpha: 0.75),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                '"$quote"',
                style: const TextStyle(
                  fontFamily: AppTheme.fraunces,
                  fontSize: 20,
                  height: 1.3,
                  color: Colors.white,
                  fontVariations: [FontVariation('wght', 500)],
                ),
              ),
            ],
          ),
          Positioned(
            right: -28,
            bottom: -28,
            child: Icon(
              Icons.eco_outlined,
              size: 92,
              color: Colors.white.withValues(alpha: 0.12),
            ),
          ),
        ],
      ),
    );
  }
}

class NextStepCard extends StatelessWidget {
  const NextStepCard({
    super.key,
    required this.kind,
    required this.onAction,
  });

  final DayNextKind kind;
  final VoidCallback onAction;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final copy = _copy(l10n);
    return SjCard(
      mist: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            copy.title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          Text(
            copy.body,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          if (copy.actionLabel != null) ...[
            const SizedBox(height: 16),
            SjGhostButton(
              label: copy.actionLabel!,
              onPressed: onAction,
            ),
          ],
        ],
      ),
    );
  }

  ({String title, String body, String? actionLabel}) _copy(
    AppLocalizations l10n,
  ) {
    switch (kind) {
      case DayNextKind.setIntentions:
        return (
          title: l10n.nextSetIntentionsTitle,
          body: l10n.nextSetIntentionsBody,
          actionLabel: l10n.setIntentions,
        );
      case DayNextKind.liveTheDay:
        return (
          title: l10n.nextLiveDayTitle,
          body: l10n.nextLiveDayBody,
          actionLabel: null,
        );
      case DayNextKind.closeTheDay:
        return (
          title: l10n.nextCloseDayTitle,
          body: l10n.nextCloseDayBody,
          actionLabel: l10n.startReflection,
        );
      case DayNextKind.rest:
        return (
          title: l10n.nextRestTitle,
          body: l10n.nextRestBody,
          actionLabel: l10n.viewReflection,
        );
      case DayNextKind.waitForDay:
        return (
          title: l10n.nextFutureTitle,
          body: l10n.nextFutureBody,
          actionLabel: null,
        );
      case DayNextKind.closePastDay:
        return (
          title: l10n.nextPastTitle,
          body: l10n.nextPastBody,
          actionLabel: l10n.startReflection,
        );
    }
  }
}

class GrowthBars extends StatelessWidget {
  const GrowthBars({super.key, required this.buckets});

  final List<ChartBucket> buckets;

  @override
  Widget build(BuildContext context) {
    final hasCounts = buckets.any((bucket) => bucket.count > 0);
    if (buckets.isEmpty || !hasCounts) {
      return SizedBox(
        height: 108,
        child: Center(
          child: Text(
            context.l10n.growthEmptyChart,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      );
    }
    var maxCount = 0;
    for (final bucket in buckets) {
      if (bucket.count > maxCount) {
        maxCount = bucket.count;
      }
    }
    final barCount = buckets.length;
    return SizedBox(
      height: 176,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          for (var barIndex = 0; barIndex < barCount; barIndex++)
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: _GrowthBarColumn(
                  bucket: buckets[barIndex],
                  maxCount: maxCount,
                  isLatest: barIndex == barCount - 1,
                  slim: barCount < 4,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _GrowthBarColumn extends StatelessWidget {
  const _GrowthBarColumn({
    required this.bucket,
    required this.maxCount,
    required this.isLatest,
    required this.slim,
  });

  final ChartBucket bucket;
  final int maxCount;
  final bool isLatest;
  final bool slim;

  @override
  Widget build(BuildContext context) {
    final heightFactor =
        0.16 + 0.84 * (bucket.count / (maxCount == 0 ? 1 : maxCount));
    final barColor = isLatest
        ? context.sjAccent
        : AppColors.sagePrimarySoft.withValues(alpha: 0.85);
    return Column(
      children: [
        Text(
          bucket.count == 0 ? ' ' : '${bucket.count}',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w700,
                color: isLatest ? context.sjAccent : null,
              ),
        ),
        const SizedBox(height: 6),
        Expanded(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: FractionallySizedBox(
              widthFactor: slim ? 0.46 : 0.78,
              heightFactor: heightFactor,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: barColor,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          bucket.label,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}
