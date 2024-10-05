import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'content_place.dart';
import 'navigation_bar_place.dart';

class PlaceRecomendedDetailPage extends StatelessWidget {
  const PlaceRecomendedDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.transparent,
      ),
      child: const Scaffold(
        body: Stack(
          children: [
            ContentPlace(),
            NavigationBarPlace(),
          ],
        ),
      ),
    );
  }
}
