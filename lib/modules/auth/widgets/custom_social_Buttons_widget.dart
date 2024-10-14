// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_text_styles.dart';
import '../../../core/widgets/custom_btn.dart';

class CustomSocialButtons extends StatelessWidget {
  CustomSocialButtons({
    super.key,
    required this.text1,
    required this.text2,
    required this.text3,
  });
  String? text1;
  String? text2;
  String? text3;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomButton(
          icon: const Icon(
            Icons.g_mobiledata_rounded,
            color: AppColors.primaryColor,
            size: 25,
          ),
          text: text1!,
          backGroundColor: AppColors.backgroundColor,
          borderColor: AppColors.primaryColor,
          onPressed: () {},
          style: AppTextStyle.Cairo600style13.copyWith(fontSize: 16),
          mainAxisAlignment: MainAxisAlignment.start,
        ),
        const SizedBox(height: 16),
        CustomButton(
          icon: const Icon(
            Icons.apple_rounded,
            color: AppColors.primaryColor,
            size: 25,
          ),
          text: text2!,
          backGroundColor: AppColors.backgroundColor,
          borderColor: AppColors.primaryColor,
          onPressed: () {},
          style: AppTextStyle.Cairo600style13.copyWith(fontSize: 16),
          mainAxisAlignment: MainAxisAlignment.start,
        ),
        const SizedBox(height: 16),
        CustomButton(
          icon: const Icon(
            Icons.facebook_rounded,
            color: AppColors.primaryColor,
            size: 25,
          ),
          text: text3!,
          backGroundColor: AppColors.backgroundColor,
          borderColor: AppColors.primaryColor,
          onPressed: () {},
          style: AppTextStyle.Cairo600style13.copyWith(fontSize: 16),
          mainAxisAlignment: MainAxisAlignment.start,
        ),
      ],
    );
  }
}
