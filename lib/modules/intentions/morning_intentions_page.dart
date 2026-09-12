import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app_state/app_state.dart';
import '../../core/components/brand_marks.dart';
import '../../core/components/sj_buttons.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_theme.dart';
import '../../core/utils/app_date.dart';
import '../../core/utils/day_rhythm.dart';
import '../../core/utils/l10n_util.dart';
import '../../l10n/app_localizations.dart';
import '../shell/app_shell.dart';

class MorningIntentionsPage extends StatefulWidget {
  const MorningIntentionsPage({super.key, this.asOnboarding = false});

  final bool asOnboarding;

  @override
  State<MorningIntentionsPage> createState() => _MorningIntentionsPageState();
}

class _MorningIntentionsPageState extends State<MorningIntentionsPage> {
  final _one = TextEditingController();
  final _two = TextEditingController();
  final _three = TextEditingController();

  int get filled =>
      [_one, _two, _three].where((c) => c.text.trim().isNotEmpty).length;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final daily = context.read<DailyState>();
      final existing = daily.intentions;
      if (existing.isNotEmpty) {
        _one.text = existing[0].text;
        if (existing.length > 1) _two.text = existing[1].text;
        if (existing.length > 2) _three.text = existing[2].text;
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _one.dispose();
    _two.dispose();
    _three.dispose();
    super.dispose();
  }

  Future<void> _setDay() async {
    final profile = context.read<ProfileState>().profile;
    if (profile == null || filled == 0) return;
    await context.read<DailyState>().setMyDay(profile.id, [
      _one.text,
      _two.text,
      _three.text,
    ]);
    if (!mounted) return;
    if (widget.asOnboarding) {
      await _goHome();
    } else {
      Navigator.of(context).pop();
    }
  }

  Future<void> _goHome() async {
    final profile = context.read<ProfileState>().profile;
    if (profile != null) {
      await context.read<DailyState>().load(profile.id);
      if (!mounted) return;
      await context.read<JourneyFeedState>().load(profile.id);
      if (!mounted) return;
      await context.read<GrowthState>().load(profile.id);
    }
    if (!mounted) return;
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => const AppShell()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final name =
        context.watch<ProfileState>().profile?.name ?? l10n.greetingFriend;
    final first = DayRhythm.firstName(name, l10n.greetingFriend);
    return Scaffold(
      appBar: AppBar(
        leading: widget.asOnboarding
            ? const Padding(
                padding: EdgeInsets.all(12),
                child: LeafMark(size: 28),
              )
            : IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.pop(context),
              ),
        title: Text(l10n.morningIntentions),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(24, 8, 24, 32),
        children: [
          const Center(child: LeafMark(size: 72)),
          const SizedBox(height: 18),
          Text(
            _greeting(l10n, first),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayMedium,
          ),
          const SizedBox(height: 6),
          Text(
            AppDate.friendlyDay(context.watch<DailyState>().selectedDay),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 22),
          SjCard(
            mist: true,
            child: Text(
              l10n.morningFraming,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          const SizedBox(height: 26),
          Row(
            children: [
              Text(
                l10n.top3Intentions,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const Spacer(),
              Text(
                l10n.filledOfThree(filled),
                style: TextStyle(
                  fontFamily: AppTheme.nunito,
                  fontSize: 12,
                  letterSpacing: 0.8,
                  color: context.sjHint,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          _slot(_one, l10n.intentionHintBreath),
          const SizedBox(height: 10),
          _slot(_two, l10n.intentionHintDraft),
          const SizedBox(height: 10),
          _slot(_three, l10n.intentionHintWalk),
          const SizedBox(height: 28),
          SjPrimaryButton(
            label: l10n.setMyDay,
            onPressed: filled == 0 ? null : _setDay,
          ),
          if (widget.asOnboarding) ...[
            const SizedBox(height: 12),
            TextButton(
              onPressed: _goHome,
              child: Text(l10n.setIntentionsLater),
            ),
          ],
          const SizedBox(height: 28),
          const Center(child: LeafMark(size: 28)),
          const SizedBox(height: 8),
          Text(
            '"${l10n.makeTodayWorthRemembering}"',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontStyle: FontStyle.italic,
                ),
          ),
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

  Widget _slot(TextEditingController controller, String hint) {
    return TextField(
      controller: controller,
      onChanged: (_) => setState(() {}),
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Icon(Icons.circle_outlined, size: 18, color: context.sjHint),
        ),
      ),
    );
  }
}
