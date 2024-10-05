import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../configs/theme.dart';
import 'decoration/field_decoration.dart';

enum PhoneFieldTheme { light, dark }

class PhoneField extends StatefulWidget {
  const PhoneField({
    super.key,
    required this.textController,
    this.hintText,
    this.onChange,
    this.readOnly = false,
    this.validator,
    this.autovalidateMode,
    this.focusNode,
    this.onFieldSubmitted,
    this.textInputAction = TextInputAction.done,
    this.phoneFieldTheme = PhoneFieldTheme.light,
    this.maxLength = 15,
  });

  final TextEditingController textController;
  final String? hintText;
  final Function(dynamic)? onChange;
  final bool readOnly;
  final String? Function(String?)? validator;
  final AutovalidateMode? autovalidateMode;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final PhoneFieldTheme phoneFieldTheme;
  final int maxLength;
  final Function(String)? onFieldSubmitted;

  @override
  State<PhoneField> createState() => _PhoneFieldState();
}

class _PhoneFieldState extends State<PhoneField> {
  bool _isFocused = false;
  bool _isFieldError = false;

  @override
  void initState() {
    widget.textController.addListener(_controllerListener);
    super.initState();
  }

  @override
  void dispose() {
    widget.textController.removeListener(_controllerListener);
    super.dispose();
  }

  void _onChanged(String value) {
    if (widget.autovalidateMode == null) {}
    if (widget.onChange != null) widget.onChange!(value);
  }

  void _onSubmitted(String value) {
    if (widget.onFieldSubmitted != null) widget.onFieldSubmitted!(value);
  }

  void _controllerListener() {
    setState(() => _onChanged(widget.textController.text));
  }

  _validator(String value) {
    if (widget.validator != null) {
      final result = widget.validator!(value);
      _isFieldError = (result != null) ? true : false;
      return result;
    }
    return;
  }

  Color get _fillFieldColor {
    if (widget.phoneFieldTheme == PhoneFieldTheme.dark) {
      return AppColors.shade;
    }
    return AppColors.background;
  }

  @override
  Widget build(BuildContext context) {
    return FocusScope(
      onFocusChange: (isFocused) => setState(() => _isFocused = isFocused),
      child: TextFormField(
        controller: widget.textController,
        readOnly: widget.readOnly,
        style: Typograph.textRegular,
        keyboardType: TextInputType.phone,
        textAlignVertical: TextAlignVertical.center,
        enableSuggestions: false,
        maxLength: widget.maxLength,
        onTapOutside: (event) {
          FocusScope.of(context).unfocus();
        },
        validator: (value) => _validator(value!),
        autovalidateMode: widget.autovalidateMode,
        onChanged: _onChanged,
        onFieldSubmitted: _onSubmitted,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          FilteringTextInputFormatter.deny(RegExp(r'^0+')),
        ],
        focusNode: widget.focusNode,
        textInputAction: widget.textInputAction,
        decoration: FieldDecoration(
          text: widget.textController.text,
          isFocused: _isFocused,
          isFieldError: _isFieldError,
          fillFieldColor: _fillFieldColor,
        ).copyWith(
          hintText: widget.hintText ?? "8123456XXX",
          prefixText: "",
          prefixIcon: Container(
            width: 0.0,
            margin: const EdgeInsets.only(left: 4),
            alignment: Alignment.center,
            child: Text(
              "+62",
              textAlign: TextAlign.center,
              style: Typograph.textRegular.copyWith(
                color: Colors.grey.shade900,
              ),
            ),
          ),
          counter: const SizedBox.shrink(),
        ),
      ),
    );
  }
}
