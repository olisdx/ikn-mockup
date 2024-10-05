import 'package:flutter/material.dart';

import '../../configs/theme.dart';
import 'decoration/field_decoration.dart';

enum TextSinFieldTheme { light, dark }

class TextDefField extends StatefulWidget {
  const TextDefField({
    super.key,
    required this.textController,
    this.hintText,
    this.keyboardType = TextInputType.text,
    this.onChange,
    this.readOnly = false,
    this.autovalidateMode,
    this.validator,
    this.focusNode,
    this.onFieldSubmitted,
    this.textCapitalization = TextCapitalization.none,
    this.textInputAction = TextInputAction.done,
    this.textSinFieldTheme = TextSinFieldTheme.light,
    this.maxLength = 100,
  });

  final TextEditingController textController;
  final TextInputType keyboardType;
  final String? hintText;
  final Function(dynamic)? onChange;
  final bool readOnly;
  final TextSinFieldTheme textSinFieldTheme;
  final AutovalidateMode? autovalidateMode;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final TextCapitalization textCapitalization;
  final Function(String)? onFieldSubmitted;
  final int maxLength;

  @override
  State<TextDefField> createState() => _TextDefFieldState();
}

class _TextDefFieldState extends State<TextDefField> {
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
    if (widget.onChange != null) widget.onChange!(value);
  }

  void _onFieldSubmitted(String value) {
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
    if (widget.textSinFieldTheme == TextSinFieldTheme.dark) {
      return AppColors.shade;
    }
    return AppColors.background;
  }

  bool get _suggesstions {
    if (widget.keyboardType == TextInputType.emailAddress) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return FocusScope(
      onFocusChange: (isFocused) => setState(() => _isFocused = isFocused),
      child: TextFormField(
        controller: widget.textController,
        readOnly: widget.readOnly,
        style: Typograph.textRegular,
        keyboardType: widget.keyboardType,
        validator: (value) => _validator(value!),
        autovalidateMode: widget.autovalidateMode,
        maxLength: widget.maxLength,
        onTapOutside: (event) {
          FocusScope.of(context).unfocus();
        },
        enableSuggestions: _suggesstions,
        focusNode: widget.focusNode,
        textAlignVertical: TextAlignVertical.center,
        textInputAction: widget.textInputAction,
        textCapitalization: widget.textCapitalization,
        onChanged: _onChanged,
        onFieldSubmitted: _onFieldSubmitted,
        decoration: FieldDecoration(
          text: widget.textController.text,
          isFocused: _isFocused,
          isFieldError: _isFieldError,
          fillFieldColor: _fillFieldColor,
        ).copyWith(
          hintText: widget.hintText,
          counter: const SizedBox.shrink(),
        ),
      ),
    );
  }
}
