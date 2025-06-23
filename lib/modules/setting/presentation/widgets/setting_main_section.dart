import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_hup/core/utils/app_strings.dart';
import 'package:fruits_hup/core/utils/app_text_styles.dart';
import 'package:fruits_hup/modules/setting/presentation/views/my_orders_view.dart';
import 'package:fruits_hup/modules/setting/presentation/views/my_personal_info_view.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';

import '../../../../core/widgets/custom_header_text.dart';
import '../../../favorites/presentation/view/favorites_view.dart';

class SettingMainSection extends StatelessWidget {
  const SettingMainSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomHeaderText(
          text1: AppStrings.all,
          styleText1: AppTextStyle.Cairo600style13,
          textAlign1: TextAlign.start,
          padding: EdgeInsets.all(0),
        ),
        const SizedBox(height: 16),
        CustomRowSettingItem(
          onTap: () {
            PersistentNavBarNavigator.pushNewScreen(
              context,
              screen: MyPersonalInfoView(),
              withNavBar: false,
              pageTransitionAnimation: PageTransitionAnimation.cupertino,
            );
          },
          data: AppStrings.personalAccount,
          leading: SvgPicture.asset(Assets.assetsImagesMyPersonalAccount),
          trailing: SvgPicture.asset(Assets.assetsImagesRightArrow),
        ),
        const Divider(color: AppColors.lighterGrey),
        CustomRowSettingItem(
          onTap: () {
            PersistentNavBarNavigator.pushNewScreen(
              context,
              screen: MyOrdersView(),
              withNavBar: false,
              pageTransitionAnimation: PageTransitionAnimation.cupertino,
            );
          },
          data: AppStrings.myOrders,
          leading: SvgPicture.asset(Assets.assetsImagesMyOrders),
          trailing: SvgPicture.asset(Assets.assetsImagesRightArrow),
        ),
        const Divider(color: AppColors.lighterGrey),
        CustomRowSettingItem(
          onTap: () {
            PersistentNavBarNavigator.pushNewScreen(
              context,
              screen: FavoritesView(),
              withNavBar: false,
              pageTransitionAnimation: PageTransitionAnimation.cupertino,
            );
          },
          data: AppStrings.favorites,
          leading: SvgPicture.asset(Assets.assetsImagesMyFavorites),
          trailing: SvgPicture.asset(Assets.assetsImagesRightArrow),
        ),
        const Divider(color: AppColors.lighterGrey),
        CustomRowSettingItem(
          onTap: () {},
          data: AppStrings.language,
          leading: SvgPicture.asset(Assets.assetsImagesMyLanguage),
          trailing: SvgPicture.asset(Assets.assetsImagesRightArrow),
        ),
        const Divider(color: AppColors.lighterGrey),
        CustomRowSettingItem(
          onTap: () {},
          data: AppStrings.theme,
          leading: SvgPicture.asset(Assets.assetsImagesMyTheme),
          trailing: SvgPicture.asset(Assets.assetsImagesRightArrow),
        ),
        const Divider(color: AppColors.lighterGrey),
      ],
    );
  }
}

class CustomRowSettingItem extends StatelessWidget {
  const CustomRowSettingItem({
    super.key,
    required this.onTap,
    this.icon,
    required this.data,
    this.leading,
    this.trailing,
  });
  final void Function() onTap;
  final String data;
  final IconData? icon;
  final Widget? leading;
  final Widget? trailing;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          leading ??
              Icon(
                icon,
                color: AppColors.primaryColor,
              ),
          const SizedBox(width: 7),
          Text(
            data,
            style: AppTextStyle.Cairo600style13.copyWith(
              color: AppColors.greyColor,
            ),
          ),
          const Spacer(),
          trailing ??
              Icon(
                Icons.arrow_forward_ios,
                color: AppColors.blackColor,
                size: 20,
              ),
        ],
      ),
    );
  }
}
