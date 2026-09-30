import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/app_colors.dart';
import '../constants/app_theme.dart';
import '../utils/pin_hasher.dart';

class PinEntryController extends ChangeNotifier {
  static final _singleDigit = RegExp(r'^\d$');

  String _value = '';

  String get value => _value;

  void appendDigit(String digit) {
    if (!_singleDigit.hasMatch(digit)) {
      return;
    }
    if (_value.length >= PinHasher.length) {
      return;
    }
    _value = '$_value$digit';
    notifyListeners();
  }

  void deleteLastDigit() {
    if (_value.isEmpty) {
      return;
    }
    _value = _value.substring(0, _value.length - 1);
    notifyListeners();
  }

  void clear() {
    if (_value.isEmpty) {
      return;
    }
    _value = '';
    notifyListeners();
  }

  void replaceWith(String next) {
    final digitsOnly = next.replaceAll(RegExp(r'[^0-9]'), '');
    final clipped = digitsOnly.length > PinHasher.length
        ? digitsOnly.substring(0, PinHasher.length)
        : digitsOnly;
    if (clipped == _value) {
      return;
    }
    _value = clipped;
    notifyListeners();
  }
}

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
    this.controller,
    this.useSystemKeyboard = true,
  });

  final ValueChanged<String> onCompleted;
  final ValueChanged<String>? onChanged;
  final String? errorText;
  final bool enabled;
  final bool autofocus;
  final int resetGeneration;
  final String? semanticsLabel;
  final double boxHeight;
  final PinEntryController? controller;
  final bool useSystemKeyboard;

  @override
  State<PinDigitField> createState() => _PinDigitFieldState();
}

class _PinDigitFieldState extends State<PinDigitField> {
  late final TextEditingController _textController;
  late final FocusNode _focusNode;
  var _lastEmitted = '';

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
    _focusNode = FocusNode()..addListener(() => setState(() {}));
    widget.controller?.addListener(_onExternalPinChanged);
  }

  @override
  void didUpdateWidget(covariant PinDigitField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.controller != widget.controller) {
      oldWidget.controller?.removeListener(_onExternalPinChanged);
      widget.controller?.addListener(_onExternalPinChanged);
    }
    if (oldWidget.resetGeneration != widget.resetGeneration) {
      _textController.clear();
      _lastEmitted = '';
      if (widget.useSystemKeyboard) {
        _focusNode.requestFocus();
      }
    }
  }

  @override
  void dispose() {
    widget.controller?.removeListener(_onExternalPinChanged);
    _textController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _onExternalPinChanged() {
    final value = widget.controller?.value ?? '';
    if (_textController.text != value) {
      _textController.value = TextEditingValue(
        text: value,
        selection: TextSelection.collapsed(offset: value.length),
      );
    }
    _emitIfNeeded(value);
  }

  void _onChanged(String value) {
    widget.controller?.replaceWith(value);
    _emitIfNeeded(value);
  }

  void _emitIfNeeded(String value) {
    setState(() {});
    widget.onChanged?.call(value);
    if (value.isEmpty) {
      _lastEmitted = '';
      return;
    }
    if (value.length == PinHasher.length && value != _lastEmitted) {
      _lastEmitted = value;
      widget.onCompleted(value);
    }
  }

  @override
  Widget build(BuildContext context) {
    final hasError = widget.errorText != null && widget.errorText!.isNotEmpty;
    final filled =
        widget.controller?.value.length ?? _textController.text.length;
    final showSystemKeyboard = widget.useSystemKeyboard;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Semantics(
          label: widget.semanticsLabel,
          textField: showSystemKeyboard,
          child: GestureDetector(
            onTap: widget.enabled && showSystemKeyboard
                ? () => _focusNode.requestFocus()
                : null,
            child: Stack(
              alignment: Alignment.center,
              children: [
                IgnorePointer(
                  child: Row(
                    children: [
                      for (
                        var digitIndex = 0;
                        digitIndex < PinHasher.length;
                        digitIndex++
                      ) ...[
                        if (digitIndex > 0) const SizedBox(width: 10),
                        Expanded(
                          child: _PinBox(
                            filled: digitIndex < filled,
                            focused:
                                widget.enabled &&
                                showSystemKeyboard &&
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
                if (showSystemKeyboard)
                  Positioned.fill(
                    child: TextField(
                      controller: _textController,
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
