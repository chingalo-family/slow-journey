import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/l10n_util.dart';
import '../constants/app_colors.dart';
import '../constants/app_theme.dart';

class PinOnScreenKeypad extends StatelessWidget {
  const PinOnScreenKeypad({
    super.key,
    required this.onDigitPressed,
    required this.onBackspacePressed,
    this.enabled = true,
    this.keyHeight = 56,
  });

  final ValueChanged<String> onDigitPressed;
  final VoidCallback onBackspacePressed;
  final bool enabled;
  final double keyHeight;

  static const _digitRows = [
    ['1', '2', '3'],
    ['4', '5', '6'],
    ['7', '8', '9'],
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (final row in _digitRows) ...[
          _KeypadRow(
            children: [
              for (final digit in row)
                _KeypadKey(
                  key: ValueKey('pin-key-$digit'),
                  enabled: enabled,
                  height: keyHeight,
                  onPressed: () => onDigitPressed(digit),
                  child: Text(digit),
                ),
            ],
          ),
          const SizedBox(height: 8),
        ],
        _KeypadRow(
          children: [
            const SizedBox.shrink(),
            _KeypadKey(
              key: const ValueKey('pin-key-0'),
              enabled: enabled,
              height: keyHeight,
              onPressed: () => onDigitPressed('0'),
              child: const Text('0'),
            ),
            _KeypadKey(
              key: const ValueKey('pin-key-backspace'),
              enabled: enabled,
              height: keyHeight,
              onPressed: onBackspacePressed,
              semanticLabel: context.l10n.pinKeypadBackspace,
              child: const Icon(Icons.backspace_outlined, size: 22),
            ),
          ],
        ),
      ],
    );
  }
}

class _KeypadRow extends StatelessWidget {
  const _KeypadRow({required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (var slotIndex = 0; slotIndex < children.length; slotIndex++) ...[
          if (slotIndex > 0) const SizedBox(width: 10),
          Expanded(child: children[slotIndex]),
        ],
      ],
    );
  }
}

class _KeypadKey extends StatelessWidget {
  const _KeypadKey({
    super.key,
    required this.enabled,
    required this.onPressed,
    required this.child,
    required this.height,
    this.semanticLabel,
  });

  final bool enabled;
  final VoidCallback onPressed;
  final Widget child;
  final double height;
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkTheme;
    final fill = isDark ? AppColors.darkInputFill : Colors.white;
    final foreground = isDark ? AppColors.darkText : AppColors.ink900;
    return SizedBox(
      height: height,
      child: Material(
        color: fill,
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
          onTap: enabled
              ? () {
                  HapticFeedback.selectionClick();
                  onPressed();
                }
              : null,
          borderRadius: BorderRadius.circular(16),
          child: Semantics(
            button: true,
            enabled: enabled,
            label: semanticLabel,
            child: Center(
              child: DefaultTextStyle(
                style: TextStyle(
                  fontFamily: AppTheme.nunito,
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: foreground,
                ),
                child: IconTheme(
                  data: IconThemeData(color: foreground),
                  child: child,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
