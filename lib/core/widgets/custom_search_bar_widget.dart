import 'package:flutter/material.dart';
import 'package:fruits_hup/core/utils/app_strings.dart';
import 'package:fruits_hup/core/utils/app_text_styles.dart';

import '../utils/app_assets.dart';
import '../utils/app_colors.dart';

class CustomSearchBarWidget extends StatelessWidget {
  const CustomSearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.whiteColor,
            boxShadow: [
              BoxShadow(
                color: Color(0x0A000000),
                spreadRadius: 2,
                blurRadius: 9,
                offset: const Offset(0, 2),
              ),
            ]),
        child: TextField(
          keyboardType: TextInputType.text,
          style: AppTextStyle.Cairo700style18,
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.whiteColor,
            prefixIcon: Image.asset(Assets.assetsIconsSearchIcon, scale: 3),
            suffixIcon: Image.asset(Assets.assetsIconsSettingIcon, scale: 3),
            hintText: AppStrings.search,
            hintStyle: AppTextStyle.Cairo400style13,
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
