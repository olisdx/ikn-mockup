import 'package:flutter/material.dart';

import '../../../configs/theme.dart';

class FieldDecoration extends InputDecoration {
  const FieldDecoration({
    required this.text,
    this.readOnly = false,
    this.enableField = true,
    this.isFieldError = false,
    this.isFocused = false,
    this.enableFillColor = true,
    required this.fillFieldColor,
  });

  final String text;
  final bool readOnly;
  final bool enableField;
  final bool isFieldError;
  final bool isFocused;
  final bool enableFillColor;
  final Color fillFieldColor;

  Color get _enableBorder {
    if (isFieldError) {
      return Colors.red;
    }
    if (isFocused) {
      return AppColors.secondary;
    }
    return AppColors.shade;
  }

  Color get _fillColor {
    return fillFieldColor;
  }

  @override
  Color? get focusColor => AppColors.secondary;

  @override
  bool get enabled => enableField;

  @override
  bool get isCollapsed => true;

  @override
  bool? get isDense => true;

  @override
  bool? get filled => true;

  @override
  Color? get fillColor => _fillColor;

  @override
  String? get prefixText => "    ";

  @override
  TextStyle? get hintStyle =>
      Typograph.textRegular.copyWith(color: AppColors.shade);

  @override
  TextStyle? get errorStyle =>
      Typograph.textTinyCaption.copyWith(color: Colors.redAccent);

  @override
  EdgeInsetsGeometry? get contentPadding => const EdgeInsets.only(
        left: 0,
        top: 16,
        bottom: 16,
      );

  @override
  InputBorder? get border => const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)));

  @override
  InputBorder? get enabledBorder => OutlineInputBorder(
        borderSide: BorderSide(color: _enableBorder),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      );

  @override
  InputBorder? get focusedBorder => OutlineInputBorder(
        borderSide: BorderSide(color: _enableBorder),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      );

  @override
  InputBorder? get errorBorder => const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.redAccent),
        borderRadius: BorderRadius.all(Radius.circular(12)),
        gapPadding: 0.0,
      );

  @override
  BoxConstraints? get suffixIconConstraints {
    return const BoxConstraints(
      maxWidth: 40,
      minWidth: 40,
    );
  }
}
