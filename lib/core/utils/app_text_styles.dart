// ignore_for_file: prefer_const_declarations

import 'package:flutter/material.dart';

import 'app_colors.dart'; // Import this for TextStyle

abstract class AppTextStyle {
  static final Cairo700style23 = const TextStyle(
    fontFamily: 'Cairo',
    fontWeight: FontWeight.w700,
    fontSize: 23,
    color: AppColors.blackColor,
  );
  static final Cairo600style13 = const TextStyle(
    fontFamily: 'Cairo',
    fontWeight: FontWeight.w600,
    fontSize: 13,
    color: AppColors.blackColor,
  );
  static final Cairo700style16 = const TextStyle(
    fontFamily: 'Cairo',
    fontWeight: FontWeight.w700,
    fontSize: 16,
    color: AppColors.whiteColor,
  );
  static final Cairo700style32 = const TextStyle(
    fontFamily: 'Cairo',
    fontWeight: FontWeight.w700,
    fontSize: 32,
    color: AppColors.blackColor,
  );
  static final Cairo400style13 = const TextStyle(
    fontFamily: 'Cairo',
    fontWeight: FontWeight.w400,
    fontSize: 13,
    color: AppColors.greyColor,
  );
  static final Cairo600style16 = const TextStyle(
    fontFamily: 'Cairo',
    fontWeight: FontWeight.w600,
    fontSize: 16,
    color: AppColors.greyColor,
  );
}
