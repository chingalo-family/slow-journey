import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../app_state/app_state.dart';
import '../../core/components/brand_marks.dart';
import '../../core/components/pin_digit_field.dart';
import '../../core/components/pin_on_screen_keypad.dart';
import '../../core/components/sj_buttons.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/sj_layout.dart';
import '../../core/utils/day_rhythm.dart';
import '../../core/utils/l10n_util.dart';

class PinUnlockPage extends StatefulWidget {
  const PinUnlockPage({super.key});

  @override
  State<PinUnlockPage> createState() => _PinUnlockPageState();
}

class _PinUnlockPageState extends State<PinUnlockPage> {
  late final PinEntryController _pinEntry;
  String? _error;
  var _resetGeneration = 0;

  @override
  void initState() {
    super.initState();
    _pinEntry = PinEntryController();
  }

  @override
  void dispose() {
    _pinEntry.dispose();
    super.dispose();
  }

  void _submitUnlock(String pin) {
    final mismatchMessage = context.l10n.pinDoesNotMatch;
    final ok = context.read<ProfileState>().unlock(pin);
    if (ok) {
      return;
    }
    HapticFeedback.heavyImpact();
    setState(() {
      _error = mismatchMessage;
      _resetGeneration += 1;
    });
    _pinEntry.clear();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final profileName = context.watch<ProfileState>().profile?.name ?? '';
    final firstName = DayRhythm.firstName(profileName, '');
    final title = firstName.isEmpty
        ? l10n.welcomeBack
        : l10n.welcomeBackName(firstName);
    final isLandscape = SjLayout.isLandscape(MediaQuery.sizeOf(context));

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isLandscape ? 20 : 28,
            vertical: isLandscape ? 8 : 16,
          ),
          child: isLandscape
              ? _LandscapeLockBody(
                  title: title,
                  pinEntry: _pinEntry,
                  errorText: _error,
                  resetGeneration: _resetGeneration,
                  onPinChanged: _onPinChanged,
                  onCompleted: _submitUnlock,
                )
              : _PortraitLockBody(
                  title: title,
                  pinEntry: _pinEntry,
                  errorText: _error,
                  resetGeneration: _resetGeneration,
                  onPinChanged: _onPinChanged,
                  onCompleted: _submitUnlock,
                ),
        ),
      ),
    );
  }

  void _onPinChanged(String value) {
    if (_error != null && value.isNotEmpty) {
      setState(() => _error = null);
    }
  }
}

class _PortraitLockBody extends StatelessWidget {
  const _PortraitLockBody({
    required this.title,
    required this.pinEntry,
    required this.errorText,
    required this.resetGeneration,
    required this.onPinChanged,
    required this.onCompleted,
  });

  final String title;
  final PinEntryController pinEntry;
  final String? errorText;
  final int resetGeneration;
  final ValueChanged<String> onPinChanged;
  final ValueChanged<String> onCompleted;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                _LockIntro(
                  title: title,
                  compact: false,
                  pinEntry: pinEntry,
                  errorText: errorText,
                  resetGeneration: resetGeneration,
                  boxHeight: 58,
                  onPinChanged: onPinChanged,
                  onCompleted: onCompleted,
                ),
                const SizedBox(height: 16),
                Align(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 400),
                    child: PinOnScreenKeypad(
                      onDigitPressed: pinEntry.appendDigit,
                      onBackspacePressed: pinEntry.deleteLastDigit,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _LandscapeLockBody extends StatelessWidget {
  const _LandscapeLockBody({
    required this.title,
    required this.pinEntry,
    required this.errorText,
    required this.resetGeneration,
    required this.onPinChanged,
    required this.onCompleted,
  });

  final String title;
  final PinEntryController pinEntry;
  final String? errorText;
  final int resetGeneration;
  final ValueChanged<String> onPinChanged;
  final ValueChanged<String> onCompleted;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: Center(
                    child: _LockIntro(
                      title: title,
                      compact: true,
                      pinEntry: pinEntry,
                      errorText: errorText,
                      resetGeneration: resetGeneration,
                      boxHeight: 48,
                      onPinChanged: onPinChanged,
                      onCompleted: onCompleted,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 360),
                      child: PinOnScreenKeypad(
                        keyHeight: 48,
                        onDigitPressed: pinEntry.appendDigit,
                        onBackspacePressed: pinEntry.deleteLastDigit,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _LockIntro extends StatelessWidget {
  const _LockIntro({
    required this.title,
    required this.compact,
    required this.pinEntry,
    required this.errorText,
    required this.resetGeneration,
    required this.boxHeight,
    required this.onPinChanged,
    required this.onCompleted,
  });

  final String title;
  final bool compact;
  final PinEntryController pinEntry;
  final String? errorText;
  final int resetGeneration;
  final double boxHeight;
  final ValueChanged<String> onPinChanged;
  final ValueChanged<String> onCompleted;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final markSize = compact ? 56.0 : 88.0;
    final markFill = context.isDarkTheme
        ? AppColors.darkSurface
        : AppColors.mistChip;
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 400),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: markSize,
            height: markSize,
            alignment: Alignment.center,
            decoration: BoxDecoration(shape: BoxShape.circle, color: markFill),
            child: LeafMark(size: compact ? 28 : 44),
          ),
          SizedBox(height: compact ? 10 : 20),
          Text(
            l10n.appName,
            style: Theme.of(context).textTheme.bodySmall
                ?.copyWith(letterSpacing: 0.6, fontWeight: FontWeight.w700),
          ),
          SizedBox(height: compact ? 4 : 8),
          Text(
            title,
            textAlign: TextAlign.center,
            style: compact
                ? Theme.of(context).textTheme.headlineLarge
                : Theme.of(context).textTheme.displayMedium,
          ),
          SizedBox(height: compact ? 4 : 8),
          Text(
            l10n.enterLocalPin,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          SizedBox(height: compact ? 14 : 28),
          SjCard(
            padding: EdgeInsets.fromLTRB(18, compact ? 14 : 22, 18, 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                PinDigitField(
                  controller: pinEntry,
                  useSystemKeyboard: false,
                  errorText: errorText,
                  resetGeneration: resetGeneration,
                  semanticsLabel: l10n.pinEntrySemantics,
                  boxHeight: boxHeight,
                  onChanged: onPinChanged,
                  onCompleted: onCompleted,
                ),
                if (!compact) ...[
                  const SizedBox(height: 14),
                  Text(
                    l10n.pinUnlockDeviceNote,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
