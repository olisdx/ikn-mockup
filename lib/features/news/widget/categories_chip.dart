import 'package:flutter/material.dart';

import '../../../configs/theme.dart';

class CategoriesChip extends StatelessWidget {
  const CategoriesChip({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  final String title;
  final bool isSelected;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: isSelected ? AppColors.secondary : Colors.white,
        ),
        child: Text(
          title,
          style: Typograph.textRegular.copyWith(
            color: isSelected ? Colors.white : AppColors.text,
          ),
        ),
      ),
    );
  }
}
