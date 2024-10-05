import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../configs/theme.dart';
import 'decoration/field_decoration.dart';

enum PasswordFieldTheme { light, dark }

class PasswordField extends StatefulWidget {
  const PasswordField({
    super.key,
    required this.textController,
    this.hintText = "Password",
    this.onChange,
    this.readOnly = false,
    this.validator,
    this.autovalidateMode,
    this.passwordFieldTheme = PasswordFieldTheme.light,
    this.maxLength = 50,
  });

  final TextEditingController textController;
  final String? hintText;
  final Function(dynamic)? onChange;
  final bool readOnly;
  final String? Function(String?)? validator;
  final AutovalidateMode? autovalidateMode;
  final PasswordFieldTheme passwordFieldTheme;
  final int maxLength;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _isFocused = false;
  bool _isPasswordVisible = false;
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
    if (widget.passwordFieldTheme == PasswordFieldTheme.dark) {
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
        keyboardType: TextInputType.visiblePassword,
        onTapOutside: (event) {
          FocusScope.of(context).unfocus();
        },
        obscuringCharacter: "●",
        obscureText: !_isPasswordVisible,
        validator: (value) => _validator(value!),
        autovalidateMode: widget.autovalidateMode,
        onChanged: _onChanged,
        maxLength: widget.maxLength,
        enableSuggestions: false,
        inputFormatters: [
          FilteringTextInputFormatter.deny(RegExp(r'\s')),
        ],
        textAlignVertical: TextAlignVertical.center,
        decoration: FieldDecoration(
          text: widget.textController.text,
          isFocused: _isFocused,
          isFieldError: _isFieldError,
          fillFieldColor: _fillFieldColor,
        ).copyWith(
          hintText: widget.hintText,
          counterText: "",
          suffixIcon: GestureDetector(
            onTap: () => setState(
              () => _isPasswordVisible = !_isPasswordVisible,
            ),
            child: Icon(
              _isPasswordVisible
                  ? Icons.visibility_outlined
                  : Icons.visibility_off_outlined,
              color: Colors.grey.shade900,
              size: 18,
            ),
          ),
        ),
      ),
    );
  }
}
