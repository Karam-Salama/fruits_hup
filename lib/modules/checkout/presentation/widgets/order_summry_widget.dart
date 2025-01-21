import 'package:flutter/material.dart';
import 'package:fruits_hup/core/utils/app_colors.dart';
import 'package:fruits_hup/core/utils/app_strings.dart';
import '../../../../core/utils/app_text_styles.dart';
import 'payment_item.dart';

class OrderSummryWidget extends StatelessWidget {
  const OrderSummryWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PaymentItem(
          tile: AppStrings.orderSummary,
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    AppStrings.subTotal,
                    style: AppTextStyle.Cairo400style13.copyWith(
                      color: AppColors.darkGreyColor,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    'جنيه',
                    textAlign: TextAlign.right,
                    style: AppTextStyle.Cairo600style16.copyWith(
                      color: AppColors.blackColor,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Text(
                    AppStrings.ordering,
                    style: AppTextStyle.Cairo400style13.copyWith(
                      color: AppColors.darkGreyColor,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '30جنية',
                    textAlign: TextAlign.right,
                    style: AppTextStyle.Cairo600style13.copyWith(
                      color: AppColors.darkGreyColor,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 9,
              ),
              const Divider(
                thickness: .5,
                color: Color(0xFFCACECE),
              ),
              const SizedBox(
                height: 9,
              ),
              Row(
                children: [
                  Text(
                    AppStrings.total,
                    style: AppTextStyle.Cairo700style16.copyWith(
                      color: AppColors.blackColor,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    ' جنيه',
                    style: AppTextStyle.Cairo700style16.copyWith(
                      color: AppColors.blackColor,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
