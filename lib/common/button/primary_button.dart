import 'package:flutter/material.dart';

import '../../configs/theme.dart';

enum PrimaryButtonType { large, medium, small, icon }

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    this.primaryButtonType = PrimaryButtonType.medium,
    required this.onTap,
    this.text = "Lanjutkan",
    this.isLoading = false,
    this.isDisable = false,
    this.width = double.maxFinite,
    this.icon,
    this.buttonColor = AppColors.secondary,
    super.key,
  });

  final PrimaryButtonType primaryButtonType;
  final String text;
  final Function() onTap;
  final bool isLoading;
  final bool isDisable;
  final double width;
  final String? icon;
  final Color buttonColor;

  Widget _largeButton() {
    return ElevatedButton(
      onPressed: (isDisable || isLoading) ? null : () async => await onTap(),
      style: ElevatedButton.styleFrom(
        minimumSize: Size(width, 54),
        padding: const EdgeInsets.symmetric(vertical: 16),
        backgroundColor: buttonColor,
      ),
      child: Text(
        text,
        style: Typograph.buttonSubtitle.copyWith(color: Colors.white),
      ),
    );
  }

  Widget _mediumButton() {
    return ElevatedButton(
      onPressed: (isDisable || isLoading) ? null : () async => await onTap(),
      style: ElevatedButton.styleFrom(
        minimumSize: Size(width, 46),
        padding: const EdgeInsets.symmetric(vertical: 12),
        backgroundColor: buttonColor,
      ),
      child: Text(
        text,
        style: Typograph.buttonSubtitle.copyWith(color: Colors.white),
      ),
    );
  }

  Widget _smallButton() {
    return ElevatedButton(
      onPressed: (isDisable || isLoading) ? null : () async => await onTap(),
      style: ElevatedButton.styleFrom(
        minimumSize: Size(width, 34),
        padding: const EdgeInsets.symmetric(vertical: 8),
        backgroundColor: buttonColor,
      ),
      child: Text(
        text,
        style: Typograph.smallButton.copyWith(color: Colors.white),
      ),
    );
  }

  Widget _iconButton() {
    return ElevatedButton(
      onPressed: (isDisable || isLoading) ? null : () async => await onTap(),
      style: ElevatedButton.styleFrom(
        minimumSize: Size(width, 54),
        padding: const EdgeInsets.symmetric(vertical: 16),
        backgroundColor: buttonColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: Typograph.buttonSubtitle.copyWith(color: Colors.white),
          ),
          const SizedBox(width: 8),
          Image.asset(
            icon!,
            width: 20,
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (primaryButtonType == PrimaryButtonType.large) {
      return _largeButton();
    }
    if (primaryButtonType == PrimaryButtonType.medium) {
      return _mediumButton();
    }
    if (primaryButtonType == PrimaryButtonType.small) {
      return _smallButton();
    }
    return _iconButton();
  }
}
