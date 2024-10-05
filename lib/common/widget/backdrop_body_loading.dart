import 'dart:ui';

import 'package:flutter/material.dart';

import '../../configs/app_colors.dart';

class BackdropBodyLoading extends StatelessWidget {
  const BackdropBodyLoading({
    super.key,
    required this.child,
    required this.isLoading,
  });

  final bool isLoading;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (isLoading) ...[
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
            child: const Center(
                child: CircularProgressIndicator(
              color: AppColors.primary,
            )),
          ),
        ]
      ],
    );
  }
}
