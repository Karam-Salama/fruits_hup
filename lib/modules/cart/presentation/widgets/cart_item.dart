import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_hup/core/utils/app_text_styles.dart';
import 'package:fruits_hup/core/widgets/custom_network_image.dart';
import 'package:fruits_hup/modules/cart/domain/entities/cart_item_entity.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import 'cart_item_action_buttons.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.cartItemEntity});
  final CartItemEntity cartItemEntity;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Row(
        children: [
          Container(
            width: 73,
            height: 92,
            decoration: const BoxDecoration(color: Color(0xFFF3F5F7)),
            child:
                CustomNetworkImage(imageUrl: cartItemEntity.productEntity.imageUrl!),
          ),
          const SizedBox(width: 17),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      cartItemEntity.productEntity.name,
                      style: AppTextStyle.Cairo700style13.copyWith(
                          color: AppColors.blackColor),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {},
                      child: SvgPicture.asset(Assets.assetsIconsTrashIcon),
                    )
                  ],
                ),
                SizedBox(height: 3),
                Text(
                  '${cartItemEntity.calculateTotalWeight()} كم',
                  style: AppTextStyle.Cairo400style13.copyWith(
                      color: AppColors.orangeColor),
                  textAlign: TextAlign.right,
                ),
                SizedBox(height: 6),
                Row(
                  children: [
                    CartItemActionButtons(),
                    const Spacer(),
                    Text(
                      '${cartItemEntity.calculateTotalPrice()} جنيه',
                      style: AppTextStyle.Cairo700style16.copyWith(
                          color: AppColors.orangeColor),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
