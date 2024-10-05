import 'package:flutter/material.dart';

import '../../../gen/assets.gen.dart';

class ContentPlace extends StatelessWidget {
  const ContentPlace({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          _PlaceImage(),
        ],
      ),
    );
  }
}

class _PlaceImage extends StatelessWidget {
  const _PlaceImage();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(
        color: Colors.amberAccent,
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 250, 30, 30),
            Color(0xFF4B79A1),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Assets.images.ikn.image(
        fit: BoxFit.cover,
        height: MediaQuery.of(context).size.height,
      ),
    );
  }
}
