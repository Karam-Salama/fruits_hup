import 'package:flutter/material.dart';
import 'package:fruits_hup/core/utils/app_colors.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: AppColors.lightGreyColor,
      height: 22,
    );
  }
}
