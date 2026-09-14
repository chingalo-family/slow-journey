import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app_state/app_state.dart';
import '../../core/components/sj_buttons.dart';
import '../../core/services/local_notification_service.dart';
import '../../core/services/preference_service.dart';
import '../../core/utils/l10n_util.dart';

class NotificationSettingsPage extends StatefulWidget {
  const NotificationSettingsPage({super.key});

  @override
  State<NotificationSettingsPage> createState() =>
      _NotificationSettingsPageState();
}

class _NotificationSettingsPageState extends State<NotificationSettingsPage> {
  bool? _osAllowed;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _refreshOsPermission());
  }

  Future<void> _refreshOsPermission() async {
    final settings = context.read<SettingsState>();
    final notifications = context.read<LocalNotificationService>();
    final prefs = context.read<PreferenceService>();
    if (settings.morningOn || settings.eveningOn) {
      await notifications.requestPermissionIfNeeded();
    }
    final allowed = await notifications.areNotificationsAllowed();
    if (allowed) {
      await notifications.syncFromPreferences(prefs);
    }
    if (!mounted) {
      return;
    }
    setState(() => _osAllowed = allowed);
  }

  Future<void> _onMorningChanged(bool enabled) async {
    final settings = context.read<SettingsState>();
    final granted = await settings.setMorning(on: enabled);
    if (!granted && mounted) {
      _showBlockedMessage();
    }
    if (mounted) {
      await _refreshOsPermission();
    }
  }

  Future<void> _onEveningChanged(bool enabled) async {
    final settings = context.read<SettingsState>();
    final granted = await settings.setEvening(on: enabled);
    if (!granted && mounted) {
      _showBlockedMessage();
    }
    if (mounted) {
      await _refreshOsPermission();
    }
  }

  void _showBlockedMessage() {
    final l10n = context.l10n;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(l10n.notificationsOsBlocked)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final settings = context.watch<SettingsState>();
    return Scaffold(
      appBar: AppBar(title: Text(l10n.notifications)),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 32),
        children: [
          if (_osAllowed == false) ...[
            SjCard(
              child: Text(
                l10n.notificationsOsBlocked,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            const SizedBox(height: 12),
          ],
          SjCard(
            child: Column(
              children: [
                SwitchListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(l10n.planMyDay),
                  subtitle: Text(_displayTime(context, settings.morningTime)),
                  value: settings.morningOn,
                  onChanged: _onMorningChanged,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                    onPressed: () async {
                      final picked = await showTimePicker(
                        context: context,
                        initialTime: _parse(settings.morningTime),
                      );
                      if (picked == null || !context.mounted) {
                        return;
                      }
                      await context
                          .read<SettingsState>()
                          .setMorning(time: _fmt(picked));
                    },
                    child: Text(l10n.changeTime),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          SjCard(
            child: Column(
              children: [
                SwitchListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(l10n.reflectCelebrate),
                  subtitle: Text(_displayTime(context, settings.eveningTime)),
                  value: settings.eveningOn,
                  onChanged: _onEveningChanged,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                    onPressed: () async {
                      final picked = await showTimePicker(
                        context: context,
                        initialTime: _parse(settings.eveningTime),
                      );
                      if (picked == null || !context.mounted) {
                        return;
                      }
                      await context
                          .read<SettingsState>()
                          .setEvening(time: _fmt(picked));
                    },
                    child: Text(l10n.changeTime),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 18),
          Text(
            l10n.remindersInvitation,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }

  TimeOfDay _parse(String hhmm) {
    final clock = hhmm.split(':');
    return TimeOfDay(hour: int.parse(clock[0]), minute: int.parse(clock[1]));
  }

  String _displayTime(BuildContext context, String hhmm) =>
      _parse(hhmm).format(context);

  String _fmt(TimeOfDay time) =>
      '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
}
