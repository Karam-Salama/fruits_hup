import 'package:flutter/material.dart';

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
              pageController.nextPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
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
