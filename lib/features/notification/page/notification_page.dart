import 'package:flutter/material.dart';

import '../../../common/widget/appbar_main.dart';
import '../../../configs/theme.dart';
import '../data/data_notification.dart';
import '../widget/notification_card.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarMain(title: "Notifikasi"),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Semua pesan",
                  style: Typograph.textRegular
                      .copyWith(fontWeight: FontWeight.w600),
                ),
                InkWell(
                  child: Text(
                    "Pengaturan",
                    style: Typograph.textRegular.copyWith(
                      color: AppColors.primary,
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 8),
            const Divider(
              color: AppColors.shade,
              thickness: 0.5,
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.separated(
                itemCount: DataNotification.notif.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final data = DataNotification.notif[index];

                  return NotificationCard(
                    title: data["title"].toString(),
                    description: data["description"].toString(),
                    date: data["date"].toString(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
