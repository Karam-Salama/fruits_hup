import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';

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
          "لديك 3 منتجات في سله التسوق",
          style: AppTextStyle.Cairo400style13.copyWith(
            color: AppColors.primaryColor,
          ),
        ),
      ),
    );
  }
}
