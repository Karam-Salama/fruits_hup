import 'package:flutter/material.dart';
import 'package:fruits_hup/modules/home/presentation/views/best_celling_view.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/widgets/custom_header_text.dart';

class BestCellingHeaderText extends StatelessWidget {
  const BestCellingHeaderText({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomHeaderText(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      text1: AppStrings.mostSold,
      text2: AppStrings.more,
      textAlign1: TextAlign.start,
      textAlign2: TextAlign.end,
      styleText1:
          AppTextStyle.Cairo700style16.copyWith(color: AppColors.blackColor),
      onpress2: () {
        PersistentNavBarNavigator.pushNewScreen(
        context,
        screen: BestCellingView(),
        withNavBar: true,
        pageTransitionAnimation: PageTransitionAnimation.cupertino,
    );
      },
    );
  }
}
