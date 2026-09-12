import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/app_colors.dart';
import '../constants/app_theme.dart';
import '../constants/sj_layout.dart';
import 'brand_marks.dart';
import 'sj_bottom_nav.dart';

class SjSideNav extends StatelessWidget {
  const SjSideNav({
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
    return Material(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border(
            right: BorderSide(color: context.sjHairline, width: 0.8),
          ),
        ),
        child: SafeArea(
          right: false,
          child: SizedBox(
            width: SjLayout.railWidth,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(12, 12, 12, 8),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: LeafMark(size: 28),
                  ),
                ),
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.fromLTRB(8, 4, 8, 16),
                    children: [
                      for (var destinationIndex = 0;
                          destinationIndex < destinations.length;
                          destinationIndex++)
                        _RailDestinationTile(
                          destination: destinations[destinationIndex],
                          selected: index == destinationIndex,
                          onTap: () {
                            HapticFeedback.selectionClick();
                            onSelect(destinationIndex);
                          },
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _RailDestinationTile extends StatelessWidget {
  const _RailDestinationTile({
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Tooltip(
        message: destination.label,
        waitDuration: const Duration(milliseconds: 400),
        child: Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(14),
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(14),
            hoverColor: accent.withValues(alpha: 0.08),
            child: ConstrainedBox(
              constraints: const BoxConstraints(minHeight: 48),
              child: Ink(
                decoration: BoxDecoration(
                  color: selected
                      ? accent.withValues(alpha: 0.15)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 3,
                      height: 28,
                      decoration: BoxDecoration(
                        color: selected ? accent : Colors.transparent,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Icon(
                      selected ? destination.selectedIcon : destination.icon,
                      color: selected ? accent : idle,
                      size: 22,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        destination.label,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontFamily: AppTheme.nunito,
                          fontSize: 13,
                          fontWeight:
                              selected ? FontWeight.w700 : FontWeight.w500,
                          color: selected ? accent : idle,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
