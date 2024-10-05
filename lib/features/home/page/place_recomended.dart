import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../configs/theme.dart';
import '../../../gen/assets.gen.dart';
import '../data/data_home.dart';
import '../widget/place_home_card.dart';

class PlaceRecomended extends StatelessWidget {
  const PlaceRecomended({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Tempat Rekomendasi",
                style: Typograph.titleH4,
              ),
              InkWell(
                onTap: () => context.goNamed(AppStrings.placeAllRoute),
                child: Text(
                  "Lihat semua",
                  style: Typograph.textRegular.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              DataHome.places.length,
              (index) {
                final data = DataHome.places[index];

                return Padding(
                  padding:
                      EdgeInsets.only(left: (index == 0) ? 24 : 0, right: 16),
                  child: PlaceHomeCard(
                    image: Assets.images.ikn.path,
                    title: data["title"].toString(),
                    tag: data["tag"].toString(),
                    onTap: () => context.goNamed(AppStrings.placeDetailRoute),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
