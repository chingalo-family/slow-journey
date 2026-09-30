import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app_state/app_state.dart';
import 'morning_intentions_page.dart';

class TodayIntentionsGate extends StatefulWidget {
  const TodayIntentionsGate({super.key, required this.child});

  final Widget child;

  @override
  State<TodayIntentionsGate> createState() => _TodayIntentionsGateState();
}

class _TodayIntentionsGateState extends State<TodayIntentionsGate> {
  var _showHome = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _openIntentionsIfNeeded();
    });
  }

  Future<void> _openIntentionsIfNeeded() async {
    if (!mounted) {
      return;
    }
    final profile = context.read<ProfileState>().profile;
    if (profile == null) {
      setState(() => _showHome = true);
      return;
    }
    final daily = context.read<DailyState>();
    final needsIntentions = await daily.todayNeedsIntentions(profile.id);
    if (!mounted) {
      return;
    }
    setState(() => _showHome = true);
    if (!needsIntentions) {
      return;
    }
    await daily.showToday(profile.id);
    if (!mounted) {
      return;
    }
    await Navigator.of(context).push<void>(
      MaterialPageRoute<void>(
        builder: (_) => const MorningIntentionsPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (!_showHome) {
      return const Scaffold(body: SizedBox.shrink());
    }
    return widget.child;
  }
}
