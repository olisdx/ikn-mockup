import 'package:flutter/material.dart';

import '../data/data_home.dart';
import '../widget/menu_card.dart';

class MenuDuck extends StatelessWidget {
  const MenuDuck({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Wrap(
        spacing: 24,
        runSpacing: 12,
        children: List.generate(
          DataHome.menu.length,
          (index) {
            final data = DataHome.menu[index];

            return MenuCard(
              icon: data["image"].toString(),
              title: data["title"].toString(),
              tag: data["tag"].toString(),
            );
          },
        ),
      ),
    );
  }
}
