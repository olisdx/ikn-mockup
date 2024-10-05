import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppbarMain extends StatelessWidget implements PreferredSizeWidget {
  const AppbarMain({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 0,
      centerTitle: true,
      leadingWidth: 40,
      title: Text(title),
      surfaceTintColor: Colors.transparent,
      leading: IconButton(
        onPressed: () => context.pop(),
        highlightColor: Colors.transparent,
        icon: const Icon(
          Icons.arrow_back_ios_new_rounded,
          size: 24,
        ),
      ),
    );
  }

  @override
  Size get preferredSize {
    return const Size.fromHeight(kToolbarHeight);
  }
}
