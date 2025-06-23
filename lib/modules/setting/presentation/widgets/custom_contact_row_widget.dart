import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';

class CustomContactRowWidget extends StatelessWidget {
  const CustomContactRowWidget({
    super.key,
    required this.onTap,
    required this.title,
    this.icon,
    this.child,
  });
  final void Function() onTap;
  final String title;
  final IconData? icon;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          child ?? Icon(icon, color: AppColors.primaryColor),
          const SizedBox(width: 8),
          Text(title, style: AppTextStyle.Cairo400style16),
          const Spacer(),
          SvgPicture.asset(Assets.assetsImagesRightArrow),
        ],
      ),
    );
  }
}
