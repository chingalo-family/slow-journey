import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../app_state/app_state.dart';
import '../../core/components/brand_marks.dart';
import '../../core/components/pin_digit_field.dart';
import '../../core/components/sj_buttons.dart';
import '../../core/constants/app_colors.dart';
import '../../core/utils/day_rhythm.dart';
import '../../core/utils/l10n_util.dart';

class PinUnlockPage extends StatefulWidget {
  const PinUnlockPage({super.key});

  @override
  State<PinUnlockPage> createState() => _PinUnlockPageState();
}

class _PinUnlockPageState extends State<PinUnlockPage> {
  String? _error;
  var _resetGeneration = 0;

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
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final profileName = context.watch<ProfileState>().profile?.name ?? '';
    final firstName = DayRhythm.firstName(profileName, '');
    final title = firstName.isEmpty
        ? l10n.welcomeBack
        : l10n.welcomeBackName(firstName);
    final keyboardInset = MediaQuery.viewInsetsOf(context).bottom;
    final markFill = context.isDarkTheme
        ? AppColors.darkSurface
        : AppColors.mistChip;

    return Scaffold(
      body: SafeArea(
        child: AnimatedPadding(
          duration: const Duration(milliseconds: 180),
          curve: Curves.easeOut,
          padding: EdgeInsets.only(bottom: keyboardInset),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 28,
                  vertical: 24,
                ),
                child: Center(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: (constraints.maxHeight - 48).clamp(0.0, double.infinity),
                      maxWidth: 400,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 88,
                          height: 88,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: markFill,
                          ),
                          child: const LeafMark(size: 44),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          l10n.appName,
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                letterSpacing: 0.6,
                                fontWeight: FontWeight.w700,
                              ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          title,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          l10n.enterLocalPin,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const SizedBox(height: 28),
                        SjCard(
                          padding: const EdgeInsets.fromLTRB(18, 22, 18, 18),
                          child: Column(
                            children: [
                              PinDigitField(
                                autofocus: true,
                                errorText: _error,
                                resetGeneration: _resetGeneration,
                                semanticsLabel: l10n.pinEntrySemantics,
                                boxHeight: 58,
                                onChanged: (value) {
                                  if (_error != null && value.isNotEmpty) {
                                    setState(() => _error = null);
                                  }
                                },
                                onCompleted: _submitUnlock,
                              ),
                              const SizedBox(height: 14),
                              Text(
                                l10n.pinUnlockDeviceNote,
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
