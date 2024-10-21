import 'package:flutter/material.dart';
import 'package:fruits_hup/modules/auth/presentation/views/signUp_view.dart';

import '../../../core/database/cache/cache_helper.dart';
import '../../../core/functions/navigation.dart';
import '../../../core/service/service_locator.dart';
import '../../../core/utils/assets.dart';
import 'page_view_item_widget.dart';

class OnboardingPageViewWidget extends StatelessWidget {
  const OnboardingPageViewWidget({
    super.key,
    required this.pageController,
  });
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PageView(
        controller: pageController,
        children: [
          PageViewItemWidget(
            isVisible: true,
            onPress: () {
              getIt<CacheHelper>()
                      .saveData(key: "welcomeVisited", value: true);
              customReplacementNavigate(context, SignupView.routeName);
            },
            backGroundImage: Assets.assetsImagesOnboardingBackGroundImage1,
            image: Assets.assetsImagesOnboardingImage1,
            titleImage: Assets.assetsImagesOnboardingTitleImage1,
            subTitleImage: Assets.assetsImagesOnboardingSubTitleImage1,
          ),
          PageViewItemWidget(
            isVisible: false,
            backGroundImage: Assets.assetsImagesOnboardingBackGroundImage2,
            image: Assets.assetsImagesOnboardingImage2,
            titleImage: Assets.assetsImagesOnboardingTitleImage2,
            subTitleImage: Assets.assetsImagesOnboardingSubTitleImage2,
          ),
        ],
      ),
    );
  }
}
