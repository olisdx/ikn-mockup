import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../gen/assets.gen.dart';

class NavigationBarPlace extends StatelessWidget {
  const NavigationBarPlace({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 28),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () => context.pop(),
            child: Container(
              padding: const EdgeInsets.fromLTRB(16, 10, 10, 10),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: const Icon(Icons.arrow_back_ios),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: Assets.images.like.image(width: 24),
          ),
        ],
      ),
    );
  }
}
