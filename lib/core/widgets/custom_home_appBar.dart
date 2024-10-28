import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_hup/core/utils/app_assets.dart';
import 'package:fruits_hup/core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';

class CustomHomeBar extends StatelessWidget {
  final Widget? leading;
  final String? title;
  final Widget? trailing;

  const CustomHomeBar({
    Key? key,
    this.leading,
    this.title,
    this.trailing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leading ??
          Image.asset(
            Assets.assetsIconsUserIcon,
            width: 40,
            height: 40,
          ),
      title: title != null
          ? Center(
              child: Text(
                title!,
                style: AppTextStyle.Cairo700style16.copyWith(
                  color: AppColors.blackColor,
                ),
              ),
            )
          : null,
      trailing: trailing ??
          Container(
            padding: const EdgeInsets.all(12),
            decoration: const ShapeDecoration(
              shape: OvalBorder(),
            ),
            child: SvgPicture.asset(Assets.assetsIconsNotificationIcon),
          ),
    );
  }
}
