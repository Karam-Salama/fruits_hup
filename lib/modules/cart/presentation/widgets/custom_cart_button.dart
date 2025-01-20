import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/widgets/custom_btn.dart';
import '../cubits/cart_cubit/cart_cubit.dart';
import '../cubits/cart_item_cubit/cubit/cart_item_cubit.dart';

class CustomCartButton extends StatelessWidget {
  const CustomCartButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemCubit, CartItemState>(
      builder: (context, state) {
        return CustomButton(
          mainAxisAlignment: MainAxisAlignment.center,
          onPressed: () {},
          text:
              "الدفع  ${context.watch<CartCubit>().cartEntity.calculateTotalPrice()} جنيه",
          style: AppTextStyle.Cairo700style16,
          padding: 16,
        );
      },
    );
  }
}
