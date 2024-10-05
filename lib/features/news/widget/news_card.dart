import 'package:flutter/material.dart';

import '../../../configs/theme.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({
    super.key,
    required this.image,
    required this.tag,
    required this.title,
    required this.date,
  });

  final String image;
  final String tag;
  final String title;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Image.asset(
              image,
              width: 120,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 10),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(tag, style: Typograph.textRegularSmall),
                const SizedBox(height: 6),
                Text(
                  title,
                  style: Typograph.textRegular.copyWith(
                    fontWeight: FontWeight.w600,
                    overflow: TextOverflow.ellipsis,
                  ),
                  maxLines: 2,
                ),
                const SizedBox(height: 10),
                Text(date, style: Typograph.textRegularSmall),
              ],
            ),
          )
        ],
      ),
    );
  }
}
