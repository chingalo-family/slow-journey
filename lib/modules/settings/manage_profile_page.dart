import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../app_state/app_state.dart';
import '../../core/components/birthday_picker_tile.dart';
import '../../core/components/brand_marks.dart';
import '../../core/components/pin_digit_field.dart';
import '../../core/components/sj_buttons.dart';
import '../../core/components/sj_chrome.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/sj_layout.dart';
import '../../core/utils/app_date.dart';
import '../../core/utils/l10n_util.dart';
import '../../core/utils/pin_hasher.dart';
import '../../core/utils/session_lock.dart';
import '../onboarding/daily_cycle_page.dart';
import 'notification_settings_page.dart';

class SetupPage extends StatelessWidget {
  const SetupPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final profile = context.watch<ProfileState>().profile;
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(12),
          child: LeafMark(size: 28),
        ),
        title: Text(l10n.setup),
      ),
      body: ListView(
        padding: SjLayout.tabBodyPaddingOf(context),
        children: [
          SjCard(
            child: Column(
              children: [
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: CircleAvatar(
                    backgroundColor: AppColors.mistAvatar,
                    child: const Padding(
                      padding: EdgeInsets.all(8),
                      child: LeafMark(size: 28),
                    ),
                  ),
                  title: Text(
                    profile?.name ?? l10n.localProfile,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  subtitle: Text(profile?.email ?? l10n.onThisDeviceOnly),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const ManageProfilePage(),
                      ),
                    );
                  },
                ),
                Divider(height: 1, color: Theme.of(context).dividerColor),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Icon(
                    Icons.notifications_none,
                    color: context.sjAccent,
                  ),
                  title: Text(l10n.notifications),
                  subtitle: Text(l10n.notificationsSubtitle),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const NotificationSettingsPage(),
                      ),
                    );
                  },
                ),
                Divider(height: 1, color: Theme.of(context).dividerColor),
                SwitchListTile(
                  contentPadding: EdgeInsets.zero,
                  secondary: Icon(
                    Icons.dark_mode_outlined,
                    color: context.sjAccent,
                  ),
                  title: Text(l10n.mutedDark),
                  subtitle: Text(l10n.mutedDarkSubtitle),
                  value: profile?.isDark ?? false,
                  onChanged: (v) async {
                    if (profile == null) return;
                    await context.read<ProfileState>().save(
                          profile.copyWith(
                            theme: v ? 'muted_dark' : 'muted_light',
                          ),
                        );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ManageProfilePage extends StatefulWidget {
  const ManageProfilePage({super.key});

  @override
  State<ManageProfilePage> createState() => _ManageProfilePageState();
}

class _ManageProfilePageState extends State<ManageProfilePage> {
  late final TextEditingController _name;
  late final TextEditingController _email;
  DateTime? _birthday;
  String? _pinError;
  var _pinResetGeneration = 0;
  var _savingPin = false;

  @override
  void initState() {
    super.initState();
    final p = context.read<ProfileState>().profile;
    _name = TextEditingController(text: p?.name ?? '');
    _email = TextEditingController(text: p?.email ?? '');
    _birthday = BirthdayPickerTile.parseStored(p?.birthday);
  }

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    super.dispose();
  }

  Future<void> _savePin(String pin) async {
    final l10n = context.l10n;
    if (!PinHasher.isValid(pin)) {
      HapticFeedback.selectionClick();
      setState(() {
        _pinError = l10n.pinMustBeFourDigits;
        _pinResetGeneration += 1;
      });
      return;
    }
    setState(() => _savingPin = true);
    final saved = await context.read<ProfileState>().setPin(pin);
    if (!mounted) {
      return;
    }
    setState(() => _savingPin = false);
    if (!saved) {
      setState(() {
        _pinError = l10n.pinMustBeFourDigits;
        _pinResetGeneration += 1;
      });
      return;
    }
    HapticFeedback.lightImpact();
    setState(() {
      _pinError = null;
      _pinResetGeneration += 1;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(l10n.pinSaved)),
    );
  }

  Future<void> _clearPin() async {
    final l10n = context.l10n;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(l10n.removePinTitle),
        content: Text(l10n.removePinBody),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, false),
            child: Text(l10n.keep),
          ),
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, true),
            child: Text(l10n.removeAction),
          ),
        ],
      ),
    );
    if (confirmed != true || !mounted) {
      return;
    }
    final settings = context.read<SettingsState>();
    await context.read<ProfileState>().clearPin();
    if (settings.autoLockOn) {
      await settings.setAutoLock(on: false);
    }
    if (!mounted) {
      return;
    }
    setState(() {
      _pinError = null;
      _pinResetGeneration += 1;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(l10n.pinCleared)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final state = context.watch<ProfileState>();
    final profile = state.profile;
    final settings = context.watch<SettingsState>();
    final hasPin = profile?.hasPin == true;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.manageProfile)),
      body: ListView(
        padding: SjLayout.tabBodyPaddingOf(context),
        children: [
          SjSectionHeader(title: l10n.profileSection),
          SjCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _LabeledField(
                  label: l10n.fieldName,
                  child: TextField(
                    controller: _name,
                    textCapitalization: TextCapitalization.words,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(hintText: l10n.hintName),
                  ),
                ),
                const SizedBox(height: 14),
                _LabeledField(
                  label: l10n.fieldEmail,
                  child: TextField(
                    controller: _email,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(hintText: l10n.hintEmail),
                  ),
                ),
                const SizedBox(height: 14),
                BirthdayPickerTile(
                  label: l10n.fieldBirthday,
                  value: _birthday,
                  onPicked: (picked) => setState(() => _birthday = picked),
                ),
                const SizedBox(height: 18),
                SjPrimaryButton(
                  label: l10n.saveProfile,
                  onPressed: profile == null
                      ? null
                      : () async {
                          await state.save(
                            profile.copyWith(
                              name: _name.text.trim(),
                              email: _email.text.trim(),
                              birthday: _birthday == null
                                  ? profile.birthday
                                  : AppDate.isoDate(_birthday),
                            ),
                          );
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(l10n.savedOnThisDevice)),
                            );
                          }
                        },
                ),
              ],
            ),
          ),
          const SizedBox(height: 26),
          SjSectionHeader(title: l10n.securitySection),
          SjCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  hasPin ? l10n.pinIsSet : l10n.pinNotSet,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 6),
                Text(
                  hasPin ? l10n.hintChangePin : l10n.hintOptionalPin,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: 14),
                PinDigitField(
                  enabled: !_savingPin,
                  errorText: _pinError,
                  resetGeneration: _pinResetGeneration,
                  semanticsLabel: l10n.pinEntrySemantics,
                  boxHeight: 56,
                  onChanged: (value) {
                    if (_pinError != null && value.isNotEmpty) {
                      setState(() => _pinError = null);
                    }
                  },
                  onCompleted: _savePin,
                ),
                if (hasPin) ...[
                  const SizedBox(height: 8),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                      onPressed: _clearPin,
                      child: Text(l10n.clearPin),
                    ),
                  ),
                ],
                const SizedBox(height: 8),
                SwitchListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(l10n.autoLock),
                  subtitle: Text(
                    hasPin
                        ? l10n.autoLockSubtitle(settings.idleMinutes)
                        : l10n.autoLockNeedsPin,
                  ),
                  value: settings.autoLockOn && hasPin,
                  onChanged: !hasPin
                      ? null
                      : (enabled) => settings.setAutoLock(on: enabled),
                ),
                if (settings.autoLockOn && hasPin) ...[
                  const SizedBox(height: 4),
                  Text(
                    l10n.autoLockIdleLabel,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(height: 8),
                  SegmentedButton<int>(
                    showSelectedIcon: false,
                    segments: [
                      for (final minutes in SessionLock.idleMinuteChoices)
                        ButtonSegment<int>(
                          value: minutes,
                          label: Text(l10n.autoLockAfterMinutes(minutes)),
                        ),
                    ],
                    selected: {settings.idleMinutes},
                    onSelectionChanged: (selected) {
                      if (selected.length != 1) {
                        return;
                      }
                      settings.setAutoLock(
                        on: true,
                        minutes: selected.elementAt(0),
                      );
                    },
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(height: 26),
          SjCard(
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(
                Icons.delete_outline,
                color: AppColors.error,
              ),
              title: Text(
                l10n.wipeLocalData,
                style: const TextStyle(
                  color: AppColors.error,
                  fontWeight: FontWeight.w700,
                ),
              ),
              subtitle: Text(l10n.wipeSubtitle),
              onTap: () async {
                final ok = await showDialog<bool>(
                  context: context,
                  builder: (dialogContext) => AlertDialog(
                    title: Text(l10n.wipeThisDevice),
                    content: Text(l10n.wipeWarning),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(dialogContext, false),
                        child: Text(l10n.keep),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pop(dialogContext, true),
                        child: Text(l10n.wipe),
                      ),
                    ],
                  ),
                );
                if (ok == true && context.mounted) {
                  await state.wipe();
                  if (context.mounted) {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (_) => const DailyCyclePage(),
                      ),
                      (route) => false,
                    );
                  }
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _LabeledField extends StatelessWidget {
  const _LabeledField({
    required this.label,
    required this.child,
  });

  final String label;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 8),
          child: Text(label, style: Theme.of(context).textTheme.bodySmall),
        ),
        child,
      ],
    );
  }
}
