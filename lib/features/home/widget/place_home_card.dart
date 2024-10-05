import 'package:flutter/material.dart';

import '../../../configs/theme.dart';

class PlaceHomeCard extends StatelessWidget {
  const PlaceHomeCard({
    super.key,
    required this.image,
    required this.title,
    required this.tag,
    required this.onTap,
  });

  final String image;
  final String title;
  final String tag;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 210,
        width: 280,
        clipBehavior: Clip.antiAlias,
        padding: const EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              image,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                tag,
                style: Typograph.textRegular.copyWith(color: AppColors.shade),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                title,
                style: Typograph.textRegular.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
