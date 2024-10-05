import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_colors.dart';
import 'app_font.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    colorScheme: ColorScheme.fromSwatch(
      cardColor: AppColors.background,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.background,
      systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: AppColors.background,
      ),
      centerTitle: true,
      titleTextStyle: Typograph.titleH4,
      elevation: 0.0,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.primaryShade,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        shadowColor: Colors.transparent,
      ),
    ),
  );
}
