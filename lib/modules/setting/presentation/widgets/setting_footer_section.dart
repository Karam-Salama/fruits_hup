import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_hup/core/utils/app_text_styles.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/custom_header_text.dart';
import '../views/about_us_view.dart';
import 'setting_main_section.dart';

class SettingFooterSection extends StatelessWidget {
  const SettingFooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomHeaderText(
          text1: AppStrings.help,
          styleText1: AppTextStyle.Cairo600style13,
          textAlign1: TextAlign.start,
          padding: EdgeInsets.all(0),
        ),
        const SizedBox(height: 16),
        CustomRowSettingItem(
          onTap: () {
            PersistentNavBarNavigator.pushNewScreen(
              context,
              screen: AboutUsView(),
              withNavBar: false,
              pageTransitionAnimation: PageTransitionAnimation.cupertino,
            );
          },
          data: AppStrings.aboutDeveloper,
          leading: Image.asset(
            Assets.assetsImagesHelp,
            height: 20,
            width: 20,
          ),
          trailing: SvgPicture.asset(Assets.assetsImagesRightArrow),
        ),
      ],
    );
  }
}
