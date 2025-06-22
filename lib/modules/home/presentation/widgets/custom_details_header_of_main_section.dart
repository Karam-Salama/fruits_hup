import 'package:flutter/material.dart';

import '../../../../core/entites/product_entity.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../cart/presentation/widgets/cart_item_action_buttons.dart';

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
      trailing: SizedBox(
        width: 100,
        child: Row(
          children: [
            CartItemActionButton(
              iconColor: AppColors.whiteColor,
              icon: Icons.add,
              color: AppColors.primaryColor,
              onPressed: () {},
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "1",
                textAlign: TextAlign.center,
                style: AppTextStyle.Cairo700style16.copyWith(
                    color: AppColors.blackColor),
              ),
            ),
            CartItemActionButton(
              iconColor: Colors.grey,
              icon: Icons.remove,
              color: const Color(0xFFF3F5F7),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
