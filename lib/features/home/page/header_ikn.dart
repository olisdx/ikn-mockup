import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../common/field/search_field.dart';
import '../../../configs/theme.dart';
import '../../../gen/assets.gen.dart';

class HeaderIkn extends StatelessWidget {
  const HeaderIkn({super.key});

  @override
  Widget build(BuildContext context) {
    final searchController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () => context.goNamed(AppStrings.newsRoute),
                  child: const Icon(Icons.newspaper_outlined),
                ),
                const SizedBox(width: 12),
                InkWell(
                  onTap: () => context.goNamed(AppStrings.notificationRoute),
                  child: const Icon(Icons.notifications_none_outlined),
                ),
                const SizedBox(width: 12),
                Assets.images.person.image(width: 38),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Assets.images.cloud.image(width: 26),
                    const SizedBox(width: 8),
                    Text(
                      "Nusantara",
                      style: Typograph.titleH4.copyWith(
                        fontWeight: FontWeight.w700,
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "28",
                          style: Typograph.textRegular.copyWith(
                            fontSize: 40,
                            fontWeight: FontWeight.w600,
                            color: AppColors.secondary,
                          ),
                        ),
                        Text(
                          "℃",
                          style: Typograph.textRegular.copyWith(fontSize: 20),
                        ),
                      ],
                    ),
                    const SizedBox(width: 6),
                    const Text("Cerah", style: Typograph.textRegular),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: SearchField(
              textController: searchController,
              hintText: "Mau cari apa?",
            ),
          ),
        ],
      ),
    );
  }
}
