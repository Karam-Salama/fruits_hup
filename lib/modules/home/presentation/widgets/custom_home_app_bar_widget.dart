import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_hup/core/utils/app_assets.dart';
import 'package:fruits_hup/core/utils/app_colors.dart';
import 'package:fruits_hup/core/utils/app_strings.dart';

import '../../../../core/utils/app_text_styles.dart';

class CustomHomeAppBarWidget extends StatelessWidget {
  const CustomHomeAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(Assets.assetsIconsUserIcon),
      title: Text(
        AppStrings.goodMorning,
        style: AppTextStyle.Cairo400style13.copyWith(fontSize: 16),
      ),
      subtitle: Text(
        AppStrings.goodAfternoon,
        style:
            AppTextStyle.Cairo700style16.copyWith(color: AppColors.blackColor),
      ),
      trailing: Container(
        padding: const EdgeInsets.all(12),
        decoration: ShapeDecoration(
          //color: AppColors.whiteColor,
          shape: OvalBorder(),
        ),
        child: SvgPicture.asset(Assets.assetsIconsNotificationIcon),
      ),
    );
  }
}
