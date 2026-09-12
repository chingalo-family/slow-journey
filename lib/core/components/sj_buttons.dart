import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/app_colors.dart';
import '../constants/app_theme.dart';

class SjPrimaryButton extends StatelessWidget {
  const SjPrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.expand = true,
  });

  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;
  final bool expand;

  @override
  Widget build(BuildContext context) {
    final child = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: expand ? MainAxisSize.max : MainAxisSize.min,
      children: [
        Text(
          label,
          style: TextStyle(
            fontFamily: AppTheme.nunito,
            fontWeight: FontWeight.w700,
            fontSize: 16,
            color: context.sjOnAccent,
          ),
        ),
        if (icon != null) ...[
          const SizedBox(width: 8),
          Icon(icon, color: context.sjOnAccent, size: 18),
        ],
      ],
    );
    return SizedBox(
      width: expand ? double.infinity : null,
      height: 54,
      child: FilledButton(
        onPressed: onPressed == null
            ? null
            : () {
                HapticFeedback.lightImpact();
                onPressed!();
              },
        style: FilledButton.styleFrom(
          backgroundColor: context.sjAccent,
          foregroundColor: context.sjOnAccent,
          disabledBackgroundColor: AppColors.sagePrimarySoft,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: child,
      ),
    );
  }
}

class SjGhostButton extends StatelessWidget {
  const SjGhostButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: FilledButton(
        onPressed: onPressed,
        style: FilledButton.styleFrom(
          backgroundColor: context.isDarkTheme
              ? AppColors.creamSurface
              : Colors.white,
          foregroundColor: AppColors.ink900,
          elevation: 0,
          shape: const StadiumBorder(),
        ),
        child: Text(
          label,
          style: const TextStyle(
            fontFamily: AppTheme.nunito,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}

class SjCard extends StatelessWidget {
  const SjCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(18),
    this.color,
    this.border,
    this.mist = false,
  });

  final Widget child;
  final EdgeInsets padding;
  final Color? color;
  final BoxBorder? border;
  final bool mist;

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkTheme;
    final radius = BorderRadius.circular(22);
    final useMistInk = mist && !isDark;
    final surface = color ??
        (useMistInk
            ? AppColors.mistChip
            : (isDark ? AppColors.darkSurface : AppColors.creamSurface));
    Widget content = child;
    if (useMistInk) {
      content = Theme(
        data: Theme.of(context).copyWith(
          textTheme: AppTheme.mistTextTheme,
          colorScheme: Theme.of(context).colorScheme.copyWith(
            onSurface: AppColors.ink900,
          ),
        ),
        child: child,
      );
    }
    final card = Material(
      color: surface,
      borderRadius: radius,
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: padding,
        child: content,
      ),
    );
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: radius,
        border: border,
        boxShadow: isDark
            ? null
            : [
                BoxShadow(
                  color: const Color(0xFF2C2E2A).withValues(alpha: 0.04),
                  blurRadius: 18,
                  offset: const Offset(0, 8),
                ),
              ],
      ),
      child: card,
    );
  }
}

class SjChip extends StatelessWidget {
  const SjChip({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(label),
      visualDensity: VisualDensity.compact,
      backgroundColor: AppColors.mistChip,
      labelStyle: const TextStyle(
        fontFamily: AppTheme.nunito,
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: AppColors.ink600,
      ),
      side: BorderSide.none,
    );
  }
}
