import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_hup/core/utils/app_text_styles.dart';
import 'package:fruits_hup/core/widgets/custom_network_image.dart';
import 'package:fruits_hup/modules/cart/domain/entities/cart_item_entity.dart';
import 'package:fruits_hup/modules/cart/presentation/cubits/cart_item_cubit/cubit/cart_item_cubit.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../cubits/cart_cubit/cart_cubit.dart';
import 'cart_item_action_buttons.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.cartItemEntity});
  final CartItemEntity cartItemEntity;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemCubit, CartItemState>(
      buildWhen: (prev, current) {
        if (current is CartItemUpdated) {
          if (current.cartItemEntity == cartItemEntity) {
            return true;
          }
        }
        return false;
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Row(
            children: [
              Container(
                width: 73,
                height: 92,
                decoration: const BoxDecoration(color: Color(0xFFF3F5F7)),
                child: CustomNetworkImage(
                    imageUrl: cartItemEntity.productEntity.imageUrl!),
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
                          onTap: () {
                            context
                                .read<CartCubit>()
                                .deleteCarItem(cartItemEntity);
                          },
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
                        CartItemActionButtons(cartItemEntity: cartItemEntity),
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
      },
    );
  }
}
