import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/app_colors.dart';
import '../constants/app_theme.dart';
import '../utils/pin_hasher.dart';

class PinDigitField extends StatefulWidget {
  const PinDigitField({
    super.key,
    required this.onCompleted,
    this.onChanged,
    this.errorText,
    this.enabled = true,
    this.autofocus = false,
    this.resetGeneration = 0,
    this.semanticsLabel,
    this.boxHeight = 64,
  });

  final ValueChanged<String> onCompleted;
  final ValueChanged<String>? onChanged;
  final String? errorText;
  final bool enabled;
  final bool autofocus;
  final int resetGeneration;
  final String? semanticsLabel;
  final double boxHeight;

  @override
  State<PinDigitField> createState() => _PinDigitFieldState();
}

class _PinDigitFieldState extends State<PinDigitField> {
  late final TextEditingController _controller;
  late final FocusNode _focusNode;
  var _lastEmitted = '';

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _focusNode = FocusNode()..addListener(() => setState(() {}));
  }

  @override
  void didUpdateWidget(covariant PinDigitField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.resetGeneration != widget.resetGeneration) {
      _controller.clear();
      _lastEmitted = '';
      _focusNode.requestFocus();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _onChanged(String value) {
    setState(() {});
    widget.onChanged?.call(value);
    if (value.length == PinHasher.length && value != _lastEmitted) {
      _lastEmitted = value;
      widget.onCompleted(value);
    }
  }

  @override
  Widget build(BuildContext context) {
    final hasError = widget.errorText != null && widget.errorText!.isNotEmpty;
    final filled = _controller.text.length;
    return Column(
      children: [
        Semantics(
          label: widget.semanticsLabel,
          textField: true,
          child: GestureDetector(
            onTap: widget.enabled ? () => _focusNode.requestFocus() : null,
            child: Stack(
              alignment: Alignment.center,
              children: [
                IgnorePointer(
                  child: Row(
                    children: [
                      for (var digitIndex = 0;
                          digitIndex < PinHasher.length;
                          digitIndex++) ...[
                        if (digitIndex > 0) const SizedBox(width: 10),
                        Expanded(
                          child: _PinBox(
                            filled: digitIndex < filled,
                            focused: widget.enabled &&
                                _focusNode.hasFocus &&
                                digitIndex ==
                                    filled.clamp(0, PinHasher.length - 1),
                            hasError: hasError,
                            height: widget.boxHeight,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                Positioned.fill(
                  child: TextField(
                    controller: _controller,
                    focusNode: _focusNode,
                    enabled: widget.enabled,
                    autofocus: widget.autofocus,
                    keyboardType: TextInputType.number,
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    showCursor: false,
                    style: const TextStyle(
                      color: Colors.transparent,
                      fontSize: 1,
                    ),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      filled: true,
                      fillColor: Colors.transparent,
                      counterText: '',
                      contentPadding: EdgeInsets.zero,
                    ),
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(PinHasher.length),
                    ],
                    onChanged: _onChanged,
                  ),
                ),
              ],
            ),
          ),
        ),
        if (hasError) ...[
          const SizedBox(height: 12),
          Text(
            widget.errorText!,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: AppTheme.nunito,
              fontSize: 14,
              color: AppColors.error,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ],
    );
  }
}

class _PinBox extends StatelessWidget {
  const _PinBox({
    required this.filled,
    required this.focused,
    required this.hasError,
    required this.height,
  });

  final bool filled;
  final bool focused;
  final bool hasError;
  final double height;

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkTheme;
    final borderColor = hasError
        ? AppColors.error
        : focused
            ? context.sjAccent
            : (isDark ? AppColors.darkHairline : const Color(0xFFD7E0C8));
    return AnimatedContainer(
      duration: const Duration(milliseconds: 160),
      height: height,
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkInputFill : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: borderColor,
          width: focused || hasError ? 1.8 : 1.2,
        ),
      ),
      alignment: Alignment.center,
      child: filled
          ? Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: hasError
                    ? AppColors.error
                    : (isDark ? AppColors.darkText : AppColors.ink900),
              ),
            )
          : null,
    );
  }
}
