import 'package:flutter/material.dart';

import '../../gen/fonts.gen.dart';
import 'theme.dart';

abstract class Typograph {
  static const titleH1 = TextStyle(
    fontFamily: FontFamily.rubik,
    color: AppColors.text,
    fontWeight: FontWeight.w700,
    fontSize: 32,
    height: 40 / 32,
  );
  static const titleH2 = TextStyle(
    fontFamily: FontFamily.rubik,
    color: AppColors.text,
    fontWeight: FontWeight.w700,
    fontSize: 24,
    height: 32 / 24,
  );
  static const titleH3 = TextStyle(
    fontFamily: FontFamily.rubik,
    color: AppColors.text,
    fontWeight: FontWeight.w700,
    fontSize: 20,
    height: 28 / 20,
  );
  static const titleH4 = TextStyle(
    fontFamily: FontFamily.rubik,
    color: AppColors.text,
    fontWeight: FontWeight.w700,
    fontSize: 16,
    height: 24 / 16,
  );

  static const textRegular = TextStyle(
    fontFamily: FontFamily.rubik,
    color: AppColors.text,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    height: 18 / 14,
  );
  static const textRegularSmall = TextStyle(
    fontFamily: FontFamily.rubik,
    color: AppColors.text,
    fontWeight: FontWeight.w400,
    fontSize: 10,
    height: 14 / 10,
  );
  static const textSmall = TextStyle(
    fontFamily: FontFamily.rubik,
    color: AppColors.text,
    fontWeight: FontWeight.w300,
    fontSize: 14,
    height: 18 / 14,
  );
  static const textTinyCaption = TextStyle(
    fontFamily: FontFamily.rubik,
    color: AppColors.text,
    fontWeight: FontWeight.w300,
    fontSize: 12,
    height: 18 / 12,
  );

  static const buttonSubtitle = TextStyle(
    fontFamily: FontFamily.rubik,
    color: AppColors.text,
    fontWeight: FontWeight.w500,
    fontSize: 14,
    height: 22 / 14,
  );
  static const smallButton = TextStyle(
    fontFamily: FontFamily.rubik,
    color: AppColors.text,
    fontWeight: FontWeight.w500,
    fontSize: 12,
    height: 18 / 12,
  );
  static const specialLink = TextStyle(
    fontFamily: FontFamily.rubik,
    color: AppColors.text,
    fontWeight: FontWeight.w500,
    fontSize: 14,
    height: 22 / 14,
  );
}
