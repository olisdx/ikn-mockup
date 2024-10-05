import 'package:flutter/material.dart';

import '../../../configs/theme.dart';

class PlaceCard extends StatelessWidget {
  const PlaceCard({
    super.key,
    required this.image,
    required this.title,
    required this.tag,
  });

  final String image;
  final String title;
  final String tag;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      clipBehavior: Clip.antiAlias,
      padding: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image.asset(
              image,
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              tag,
              style: Typograph.textRegular.copyWith(color: AppColors.shade),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              title,
              style: Typograph.textRegular.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
