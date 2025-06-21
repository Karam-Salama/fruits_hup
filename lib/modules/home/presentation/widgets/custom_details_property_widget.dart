import 'package:flutter/material.dart';

import '../../../../core/entites/product_entity.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';

class CustomDetailsPropertyWidget extends StatelessWidget {
  const CustomDetailsPropertyWidget({
    super.key,
    required this.productEntity,
    required this.propertyTitle,
    required this.propertySubtitle,
    required this.widget,
  });
  final ProductEntity productEntity;
  final String propertyTitle;
  final String propertySubtitle;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.lightGreyColor, width: 1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  propertyTitle,
                  style: AppTextStyle.Cairo700style13.copyWith(fontSize: 16),
                ),
                const SizedBox(height: 4),
                Text(
                  propertySubtitle,
                  style: AppTextStyle.Cairo700style13.copyWith(
                    fontSize: 14,
                    color: AppColors.greyColor,
                  ),
                ),
              ],
            ),
            Spacer(),
            widget
          ],
        ),
      ),
    );
  }
}
