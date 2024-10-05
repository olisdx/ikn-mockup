import 'package:flutter/material.dart';

import '../../configs/theme.dart';

enum SecondaryButtonType { large, medium, small, icon }

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
    this.secondaryButtonType = SecondaryButtonType.medium,
    required this.text,
    required this.onTap,
    this.isLoading = false,
    this.isDisable = false,
    this.width = double.maxFinite,
    this.icon,
    this.buttonColor = Colors.transparent,
    this.borderColor = AppColors.secondary,
    super.key,
  });

  final SecondaryButtonType secondaryButtonType;
  final String text;
  final Function() onTap;
  final bool isLoading;
  final bool isDisable;
  final double width;
  final String? icon;
  final Color buttonColor;
  final Color borderColor;

  Widget _largeButton() {
    return ElevatedButton(
      onPressed: (isDisable || isLoading) ? null : () async => await onTap(),
      style: ElevatedButton.styleFrom(
        minimumSize: Size(width, 54),
        padding: const EdgeInsets.symmetric(vertical: 16),
        backgroundColor: buttonColor,
        foregroundColor: AppColors.shade,
        side: BorderSide(color: borderColor, width: 1.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Text(
        text,
        style: Typograph.buttonSubtitle,
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
        foregroundColor: AppColors.shade,
        side: BorderSide(color: borderColor, width: 1.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Text(
        text,
        style: Typograph.buttonSubtitle,
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
        foregroundColor: AppColors.shade,
        side: BorderSide(color: borderColor, width: 1.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Text(
        text,
        style: Typograph.smallButton,
      ),
    );
  }

  Widget _iconButton() {
    return OutlinedButton(
      onPressed: (isDisable || isLoading) ? null : () async => await onTap(),
      style: OutlinedButton.styleFrom(
        minimumSize: Size(width, 46),
        padding: const EdgeInsets.symmetric(vertical: 12),
        backgroundColor: buttonColor,
        foregroundColor: AppColors.shade,
        side: BorderSide(color: borderColor, width: 1.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            icon!,
            width: 20,
          ),
          const SizedBox(width: 8),
          Text(
            text,
            style: Typograph.buttonSubtitle,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (secondaryButtonType == SecondaryButtonType.large) {
      return _largeButton();
    }
    if (secondaryButtonType == SecondaryButtonType.medium) {
      return _mediumButton();
    }
    if (secondaryButtonType == SecondaryButtonType.small) {
      return _smallButton();
    }
    return _iconButton();
  }
}
