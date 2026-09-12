import 'package:flutter/material.dart';

import '../../core/components/brand_marks.dart';
import '../../core/components/sj_buttons.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_theme.dart';
import '../../core/utils/l10n_util.dart';
import 'welcome_profile_page.dart';

class DailyCyclePage extends StatelessWidget {
  const DailyCyclePage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(28, 18, 28, 28),
          child: Column(
            children: [
              Text(
                l10n.yourJourney.toUpperCase(),
                style: Theme.of(context).textTheme.labelSmall,
              ),
              const SizedBox(height: 18),
              Text(
                l10n.yourDailyCycle,
                style: Theme.of(context).textTheme.displayMedium,
              ),
              const SizedBox(height: 10),
              Text(
                l10n.cycleSubtitle,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 36),
              SjCard(
                padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 18),
                child: Column(
                  children: [
                    _CycleRow(
                      icon: Icons.wb_sunny_outlined,
                      title: l10n.cycleMorningTitle,
                      subtitle: l10n.cycleMorningSubtitle,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: LeafMark(size: 28),
                    ),
                    _CycleRow(
                      icon: Icons.nightlight_outlined,
                      title: l10n.cycleEveningTitle,
                      subtitle: l10n.cycleEveningSubtitle,
                    ),
                  ],
                ),
              ),
              const Spacer(),
              SjPrimaryButton(
                label: l10n.getStarted,
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const WelcomeProfilePage(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CycleRow extends StatelessWidget {
  const _CycleRow({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  final IconData icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 46,
          height: 46,
          decoration: const BoxDecoration(
            color: AppColors.mistAvatar,
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: AppColors.sagePrimaryDark),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontFamily: AppTheme.nunito,
                  fontWeight: FontWeight.w700,
                  fontSize: 14.5,
                ),
              ),
              const SizedBox(height: 2),
              Text(subtitle, style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
        ),
      ],
    );
  }
}
