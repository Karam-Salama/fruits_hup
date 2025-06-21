import 'package:flutter/material.dart';

import '../../../../core/entites/product_entity.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_strings.dart';
import 'custom_details_property_widget.dart';

class CustomDetailsSecondRowOfProperties extends StatelessWidget {
  const CustomDetailsSecondRowOfProperties({
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
          propertyTitle:
              "${productEntity.numberOfCalories} ${AppStrings.calories}",
          propertySubtitle: "100 ${AppStrings.grain}",
          widget: Image.asset(
            Assets.assetsImagesCalories,
            width: 30,
            height: 30,
          ),
        ),
        const SizedBox(width: 16),
        CustomDetailsPropertyWidget(
          productEntity: productEntity,
          propertyTitle: '4.8 (256)',
          propertySubtitle: AppStrings.reviewsCount,
          widget: Image.asset(
            Assets.assetsImagesReviews,
            width: 30,
            height: 30,
          ),
        ),
      ],
    );
  }
}
