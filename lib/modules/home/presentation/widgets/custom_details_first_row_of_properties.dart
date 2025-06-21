import 'package:flutter/material.dart';

import '../../../../core/entites/product_entity.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_text_styles.dart';
import 'custom_details_property_widget.dart';

class CustomDetailsFirstRowOfProperties extends StatelessWidget {
  const CustomDetailsFirstRowOfProperties({
    super.key,
    required this.productEntity,
  });
  final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomDetailsPropertyWidget(
          productEntity: productEntity,
          propertyTitle: AppStrings.all,
          propertySubtitle: AppStrings.permission,
          widget: Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                productEntity.expirationsMonths.toString(),
                style: AppTextStyle.Cairo700style13.copyWith(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        CustomDetailsPropertyWidget(
          productEntity: productEntity,
          propertyTitle: AppStrings.percent,
          propertySubtitle: AppStrings.organic,
          widget: Container(
            width: 40,
            height: 40,
            child: Image.asset(
              Assets.assetsImagesOrganic,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
