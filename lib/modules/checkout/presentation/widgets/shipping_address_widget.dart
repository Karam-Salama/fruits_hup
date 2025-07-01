import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_hup/core/utils/app_strings.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../domain/entities/order_entity.dart';
import 'payment_item.dart';

class ShippingAddressWidget extends StatelessWidget {
  const ShippingAddressWidget({
    super.key,
    required this.pageController,
  });

  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    var orderEntity = context.read<OrderInputEntity>();
    return PaymentItem(
      tile: AppStrings.orderingAddress,
      child: Row(
        children: [
          SvgPicture.asset(Assets.assetsIconsLocationIcon),
          const SizedBox(width: 8),
          Text('${orderEntity.shippingAddressEntity}',
              textAlign: TextAlign.right, style: AppTextStyle.Cairo400style16),
          const Spacer(),
          GestureDetector(
            onTap: () {
              pageController.animateToPage(
                1,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeIn,
              );
            },
            child: SizedBox(
              child: Row(
                children: [
                  SvgPicture.asset(Assets.imagesEdit),
                  const SizedBox(width: 4),
                  Text(AppStrings.edit, style: AppTextStyle.Cairo400style16)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
