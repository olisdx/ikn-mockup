import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../configs/theme.dart';
import 'decoration/field_decoration.dart';

class SearchField extends StatefulWidget {
  const SearchField({
    super.key,
    required this.textController,
    this.hintText,
    this.onChange,
    this.readOnly = false,
    this.onTap,
    this.isLoading = false,
    this.isHideIcon = false,
    this.onFieldSubmitted,
    this.keyboardType = TextInputType.text,
    this.isSearchEmpty = false,
    this.inputFormatters,
    this.maxLength = 100,
  });

  final TextEditingController textController;
  final String? hintText;
  final Function(dynamic)? onChange;
  final bool readOnly;
  final Function()? onTap;
  final bool isLoading;
  final bool isHideIcon;
  final Function(String)? onFieldSubmitted;
  final TextInputType keyboardType;
  final bool isSearchEmpty;

  final int maxLength;
  final List<TextInputFormatter>? inputFormatters;

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  bool _isFocused = false;
  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  Widget get _prefixIcon {
    return GestureDetector(
      onTap: () {
        final isSearch = widget.isSearchEmpty ||
            widget.textController.text.trim().isNotEmpty;

        if (isSearch && (widget.onTap != null)) {
          widget.onTap!();
        }
        FocusScope.of(context).unfocus();
        return;
      },
      child: const Icon(
        Icons.search,
        size: 28,
      ),
    );
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
        maxLength: 30,
        onTapOutside: (event) {
          FocusScope.of(context).unfocus();
        },
        enableSuggestions: false,
        textAlignVertical: TextAlignVertical.center,
        textInputAction: TextInputAction.search,
        decoration: FieldDecoration(
          text: widget.textController.text,
          isFocused: _isFocused,
          fillFieldColor: Colors.white,
        ).copyWith(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          hintStyle: Typograph.textRegular.copyWith(color: AppColors.shade),
          hintText: widget.hintText,
          prefixIcon: _prefixIcon,
          prefixText: "",
          counter: const SizedBox.shrink(),
        ),
      ),
    );
  }
}
