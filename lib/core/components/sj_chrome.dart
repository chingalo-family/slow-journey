import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/app_colors.dart';
import '../constants/app_theme.dart';
import '../utils/l10n_util.dart';

class SjProfileButton extends StatelessWidget {
  const SjProfileButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: context.l10n.manageProfile,
      onPressed: () {
        HapticFeedback.selectionClick();
        onPressed();
      },
      icon: CircleAvatar(
        radius: 16,
        backgroundColor: AppColors.mistAvatar,
        child: const Icon(
          Icons.person_outline,
          size: 18,
          color: AppColors.sagePrimaryDark,
        ),
      ),
    );
  }
}

class SjStreakChip extends StatelessWidget {
  const SjStreakChip({super.key, required this.streak});

  final int streak;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final active = streak > 0;
    final caption = active ? l10n.streakShort : l10n.streakBegin;
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: Center(
        child: Semantics(
          label: active ? l10n.nDayStreak(streak) : caption,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: AppColors.mistChip,
              borderRadius: BorderRadius.circular(22),
              border: Border.all(
                color: AppColors.sagePrimarySoft.withValues(alpha: 0.55),
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.sagePrimaryDark.withValues(alpha: 0.08),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(6, 5, 12, 5),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 26,
                    height: 26,
                    decoration: const BoxDecoration(
                      color: AppColors.creamSurface,
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.eco_rounded,
                      size: 15,
                      color: active
                          ? AppColors.sagePrimaryDark
                          : AppColors.ink300,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '$streak',
                        style: TextStyle(
                          fontFamily: AppTheme.nunito,
                          fontSize: 15,
                          height: 1.05,
                          fontWeight: FontWeight.w800,
                          color: active
                              ? AppColors.sagePrimaryDark
                              : AppColors.ink300,
                        ),
                      ),
                      Text(
                        caption.toUpperCase(),
                        style: TextStyle(
                          fontFamily: AppTheme.nunito,
                          fontSize: 9,
                          height: 1.1,
                          letterSpacing: 0.6,
                          fontWeight: FontWeight.w700,
                          color: active
                              ? AppColors.sagePrimaryDark
                              : AppColors.ink300,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SjSectionHeader extends StatelessWidget {
  const SjSectionHeader({
    super.key,
    required this.title,
    this.trailing,
    this.icon,
  });

  final String title;
  final Widget? trailing;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          if (icon != null) ...[
            Icon(icon, color: context.sjAccentSoft, size: 20),
            const SizedBox(width: 8),
          ],
          Expanded(
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          ?trailing,
        ],
      ),
    );
  }
}
