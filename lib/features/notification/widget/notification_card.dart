import 'package:flutter/material.dart';

import '../../../configs/theme.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({
    super.key,
    required this.title,
    required this.description,
    required this.date,
  });

  final String title;
  final String description;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
              shape: BoxShape.circle, color: Colors.grey.shade300),
          child: Icon(
            Icons.report_outlined,
            size: 20,
            color: Colors.grey.shade700,
          ),
        ),
        const SizedBox(width: 10),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Typograph.textRegular,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: Typograph.textTinyCaption,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),
              Text(date, style: Typograph.textRegularSmall),
            ],
          ),
        ),
      ],
    );
  }
}
