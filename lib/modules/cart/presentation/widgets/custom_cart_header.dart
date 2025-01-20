import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../cubits/cart_cubit/cart_cubit.dart';

class CustomCartHeader extends StatelessWidget {
  const CustomCartHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 40,
      color: AppColors.lighterGreen,
      child: Center(
        child: Text(
          "لديك ${context.watch<CartCubit>().cartEntity.cartItems.length} منتجات في سله التسوق",
          style: AppTextStyle.Cairo400style13.copyWith(
            color: AppColors.primaryColor,
          ),
        ),
      ),
    );
  }
}
