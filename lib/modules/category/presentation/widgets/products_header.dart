// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_text_styles.dart';

class ProductsHeader extends StatelessWidget {
  const ProductsHeader({super.key, required this.productsLength});
  final int productsLength;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              '${productsLength} ${AppStrings.results}',
              style: AppTextStyle.Cairo700style16.copyWith(
                color: AppColors.blackColor,
              ),
              textAlign: TextAlign.start,
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              height: 31,
              width: 44,
              padding: const EdgeInsets.all(3.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(color: AppColors.greyColor),
              ),
              child: SvgPicture.asset(
                Assets.assetsIconsData,
                color: AppColors.greyColor,
                height: 20,
                width: 20,
              ),
            ),
          )
        ],
      ),
    );
  }
}
