import 'package:flutter/material.dart';

import '../../../../core/entites/product_entity.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_text_styles.dart';

class CustomDetailsHeaderOfMainSection extends StatelessWidget {
  const CustomDetailsHeaderOfMainSection({
    super.key,
    required this.productEntity,
  });
  final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    return ListTile(
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
                text: '${productEntity.price} ${AppStrings.currency}',
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
    );
  }
}
