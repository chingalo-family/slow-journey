import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app_state/app_state.dart';
import '../../core/components/birthday_picker_tile.dart';
import '../../core/components/brand_marks.dart';
import '../../core/components/sj_buttons.dart';
import '../../core/utils/app_date.dart';
import '../../core/utils/l10n_util.dart';
import '../intentions/morning_intentions_page.dart';

class WelcomeProfilePage extends StatefulWidget {
  const WelcomeProfilePage({super.key});

  @override
  State<WelcomeProfilePage> createState() => _WelcomeProfilePageState();
}

class _WelcomeProfilePageState extends State<WelcomeProfilePage> {
  final _name = TextEditingController();
  final _email = TextEditingController();
  DateTime? _birthday;
  bool _busy = false;

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    super.dispose();
  }

  Future<void> _continue() async {
    if (_name.text.trim().isEmpty) return;
    setState(() => _busy = true);
    await context.read<ProfileState>().create(
          name: _name.text,
          email: _email.text,
          birthday: _birthday == null ? null : AppDate.isoDate(_birthday),
        );
    if (!mounted) return;
    await context.read<SettingsState>().activateDefaultReminders();
    if (!mounted) return;
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (_) => const MorningIntentionsPage(asOnboarding: true),
      ),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(28, 24, 28, 32),
          children: [
            const Align(alignment: Alignment.center, child: LeafMark(size: 48)),
            const SizedBox(height: 20),
            Text(
              l10n.startYourJourney,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displayMedium,
            ),
            const SizedBox(height: 8),
            Text(
              l10n.welcomeProfileSubtitle,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 28),
            TextField(
              controller: _name,
              textCapitalization: TextCapitalization.words,
              decoration: InputDecoration(hintText: l10n.hintYourName),
              onChanged: (_) => setState(() {}),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _email,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: l10n.hintEmailOptional,
              ),
            ),
            const SizedBox(height: 12),
            BirthdayPickerTile(
              value: _birthday,
              onPicked: (picked) => setState(() => _birthday = picked),
            ),
            const SizedBox(height: 28),
            SjPrimaryButton(
              label: _busy ? l10n.saving : l10n.begin,
              onPressed: _name.text.trim().isEmpty || _busy ? null : _continue,
            ),
            const SizedBox(height: 16),
            Text(
              l10n.pinLaterHint,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
