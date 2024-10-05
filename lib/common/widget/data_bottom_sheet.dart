import 'package:flutter/material.dart';

import '../../configs/theme.dart';
import '../button/primary_button.dart';

class DataBottomSheet {
  DataBottomSheet._();
  static DataBottomSheet get instance => DataBottomSheet._();

  Future<T?> show<T>({
    required BuildContext context,
    required String title,
    required String description,
    String? textButton = "Lanjutkan",
    Function()? onTap,
  }) async {
    return showModalBottomSheet<T>(
      context: context,
      isDismissible: false,
      builder: (context) {
        return Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
          decoration: const BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Typograph.titleH3,
              ),
              const SizedBox(height: 8),
              Text(
                description,
                style: Typograph.textRegular,
              ),
              const SizedBox(height: 24),
              if (onTap != null) ...[
                PrimaryButton(
                  onTap: onTap,
                  text: textButton!,
                ),
                const SizedBox(height: 24),
              ]
            ],
          ),
        );
      },
    );
  }
}
