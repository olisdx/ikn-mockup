import 'package:flutter/material.dart';

import '../../../configs/theme.dart';
import '../../../gen/assets.gen.dart';

class Collaboration extends StatelessWidget {
  const Collaboration({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              height: 120,
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                ),
              ),
              child: Assets.images.collab.image(fit: BoxFit.cover),
            ),
          ),
          const SizedBox(width: 6),
          InkWell(
            onTap: () => showModalBottomSheet(
              context: context,
              builder: (context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(24),
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
                      const Text(
                        "Hubungi Kami",
                        style: Typograph.titleH3,
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Assets.images.youtube.image(width: 52),
                          const SizedBox(width: 12),
                          Assets.images.x.image(width: 52),
                          const SizedBox(width: 12),
                          Assets.images.facebook.image(width: 52),
                          const SizedBox(width: 12),
                          Assets.images.whatsapp.image(width: 52)
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
            child: Container(
              height: 120,
              width: 42,
              decoration: const BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
              ),
              child: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
