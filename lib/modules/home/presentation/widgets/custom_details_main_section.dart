import 'package:flutter/material.dart';

import '../../../../core/entites/product_entity.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_text_styles.dart';

class DetailsMainSection extends StatelessWidget {
  const DetailsMainSection({super.key, required this.productEntity});
  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 8),
            title: Text(
              productEntity.name,
              textAlign: TextAlign.right,
              style: AppTextStyle.Cairo600style13.copyWith(fontSize: 15),
            ),
            subtitle: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                      text: '${productEntity.price}جنية',
                      style: AppTextStyle.Cairo600style10),
                  TextSpan(
                    text: AppStrings.kilo,
                    style: AppTextStyle.Cairo600style10,
                  ),
                ],
              ),
              textAlign: TextAlign.right,
            ),
            trailing: SizedBox(width: 100),
          )
        ],
      ),
    );
  }
}
