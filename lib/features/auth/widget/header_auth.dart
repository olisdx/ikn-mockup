import 'package:flutter/material.dart';

import '../../../configs/theme.dart';
import '../../../gen/assets.gen.dart';

class HeaderAuth extends StatelessWidget {
  const HeaderAuth({
    super.key,
    required this.title,
    required this.description,
  });
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width,
      height: 200,
      child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: AppColors.dark,
            ),
            child: Assets.images.bgMotif.image(
              width: size.width,
              fit: BoxFit.fitWidth,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.dark,
                  AppColors.dark,
                  AppColors.dark.withOpacity(0.9),
                  AppColors.dark.withOpacity(0.7),
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topRight,
              ),
            ),
          ),
          Positioned(
            bottom: 24,
            left: 24,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Typograph.titleH2.copyWith(
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  description,
                  style: Typograph.titleH4.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
