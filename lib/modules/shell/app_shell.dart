import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app_state/app_state.dart';
import '../../core/components/sj_bottom_nav.dart';
import '../../core/components/sj_side_nav.dart';
import '../../core/constants/sj_layout.dart';
import '../../core/utils/l10n_util.dart';
import '../growth/growth_page.dart';
import '../journey_feed/journey_feed_page.dart';
import '../planner/planner_page.dart';
import '../settings/manage_profile_page.dart';

class AppShell extends StatefulWidget {
  const AppShell({super.key, this.initialIndex = 0});

  final int initialIndex;

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  late int _index = widget.initialIndex;

  static const _pages = [
    JourneyFeedPage(),
    PlannerPage(),
    GrowthPage(),
    SetupPage(),
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }
      context.read<SettingsState>().activateDefaultReminders();
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final size = MediaQuery.sizeOf(context);
    final useSideNav = SjLayout.useSideNavigation(size);
    final destinations = [
      SjNavDestination(
        icon: Icons.home_outlined,
        selectedIcon: Icons.home_rounded,
        label: l10n.navFeed,
      ),
      SjNavDestination(
        icon: Icons.wb_sunny_outlined,
        selectedIcon: Icons.wb_sunny_rounded,
        label: l10n.navPlanner,
      ),
      SjNavDestination(
        icon: Icons.eco_outlined,
        selectedIcon: Icons.eco_rounded,
        label: l10n.navGrowth,
      ),
      SjNavDestination(
        icon: Icons.tune_outlined,
        selectedIcon: Icons.tune_rounded,
        label: l10n.navSetup,
      ),
    ];

    if (useSideNav) {
      return Scaffold(
        body: Row(
          children: [
            SjSideNav(
              index: _index,
              destinations: destinations,
              onSelect: (selectedIndex) => setState(() => _index = selectedIndex),
            ),
            Expanded(
              child: IndexedStack(index: _index, children: _pages),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      extendBody: true,
      body: IndexedStack(index: _index, children: _pages),
      bottomNavigationBar: SjBottomNav(
        index: _index,
        destinations: destinations,
        onSelect: (selectedIndex) => setState(() => _index = selectedIndex),
      ),
    );
  }
}
