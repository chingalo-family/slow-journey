import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/components/brand_marks.dart';
import '../../core/components/sj_buttons.dart';
import '../../core/constants/app_colors.dart';
import '../../core/utils/l10n_util.dart';

class DayCompletePage extends StatelessWidget {
  const DayCompletePage({super.key, required this.streak});

  final int streak;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final compact = MediaQuery.sizeOf(context).height < 560;
    final markSize = compact ? 72.0 : 112.0;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(28, compact ? 16 : 24, 28, 28),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: markSize,
                        height: markSize,
                        decoration: const BoxDecoration(
                          color: AppColors.mistChip,
                          shape: BoxShape.circle,
                        ),
                        alignment: Alignment.center,
                        child: LeafMark(size: compact ? 40 : 64),
                      ),
                      SizedBox(height: compact ? 16 : 28),
                      Text(
                        l10n.dayComplete,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        l10n.todayCompleteRest,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      SizedBox(height: compact ? 16 : 28),
                      SjCard(
                        mist: true,
                        padding: EdgeInsets.symmetric(
                          vertical: compact ? 14 : 22,
                          horizontal: 18,
                        ),
                        child: Column(
                          children: [
                            Text(
                              '$streak',
                              style: Theme.of(context).textTheme.displayLarge,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              l10n.nDayStreak(streak),
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              l10n.consistentForDays(streak),
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: compact ? 20 : 32),
                      SjPrimaryButton(
                        label: l10n.continueAction,
                        onPressed: () {
                          HapticFeedback.lightImpact();
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
