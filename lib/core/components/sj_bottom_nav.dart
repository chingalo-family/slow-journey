import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/app_colors.dart';
import '../constants/app_theme.dart';

class SjNavDestination {
  const SjNavDestination({
    required this.icon,
    required this.selectedIcon,
    required this.label,
  });

  final IconData icon;
  final IconData selectedIcon;
  final String label;
}

class SjBottomNav extends StatelessWidget {
  const SjBottomNav({
    super.key,
    required this.index,
    required this.destinations,
    required this.onSelect,
  });

  final int index;
  final List<SjNavDestination> destinations;
  final ValueChanged<int> onSelect;

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkTheme;
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: isDark ? AppColors.darkSurface : AppColors.creamSurface,
          borderRadius: BorderRadius.circular(28),
          border: Border.all(color: context.sjHairline),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: isDark ? 0.28 : 0.08),
              blurRadius: 24,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(28),
          child: SafeArea(
            top: false,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(6, 6, 6, 6),
              child: Row(
                children: [
                  for (var destinationIndex = 0;
                      destinationIndex < destinations.length;
                      destinationIndex++)
                    Expanded(
                      child: _NavTab(
                        destination: destinations[destinationIndex],
                        selected: index == destinationIndex,
                        onTap: () {
                          HapticFeedback.selectionClick();
                          onSelect(destinationIndex);
                        },
                      ),
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

class _NavTab extends StatelessWidget {
  const _NavTab({
    required this.destination,
    required this.selected,
    required this.onTap,
  });

  final SjNavDestination destination;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final accent = context.sjAccent;
    final idle = context.sjNavIdle;
    return Semantics(
      button: true,
      selected: selected,
      label: destination.label,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(22),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          curve: Curves.easeOutCubic,
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: selected ? accent.withValues(alpha: 0.16) : Colors.transparent,
            borderRadius: BorderRadius.circular(22),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                selected ? destination.selectedIcon : destination.icon,
                color: selected ? accent : idle,
                size: 22,
              ),
              const SizedBox(height: 3),
              Text(
                destination.label,
                style: TextStyle(
                  fontFamily: AppTheme.nunito,
                  fontSize: 11,
                  fontWeight: selected ? FontWeight.w800 : FontWeight.w600,
                  color: selected ? accent : idle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
