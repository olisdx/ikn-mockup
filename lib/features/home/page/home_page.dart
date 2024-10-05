import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../configs/theme.dart';
import 'collaboration.dart';
import 'header_ikn.dart';
import 'menu_duck.dart';
import 'place_recomended.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: AppColors.background,
      ),
      child: Scaffold(
        floatingActionButton: InkWell(
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 34,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: AppColors.secondary,
            ),
            child: const Icon(
              Icons.qr_code,
              color: Colors.white,
              size: 28,
            ),
          ),
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterFloat,
        body: const SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.only(bottom: 72),
            child: Column(
              children: [
                HeaderIkn(),
                SizedBox(height: 24),
                MenuDuck(),
                SizedBox(height: 24),
                PlaceRecomended(),
                SizedBox(height: 24),
                Collaboration(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
