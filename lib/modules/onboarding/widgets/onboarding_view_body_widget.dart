import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hup/core/utils/app_colors.dart';
import 'package:fruits_hup/core/utils/app_strings.dart';
import 'package:fruits_hup/core/utils/app_text_styles.dart';
import 'package:fruits_hup/core/widgets/custom_btn.dart';
import 'package:fruits_hup/modules/auth/presentation/views/signUp_view.dart';

import '../../../core/database/cache/cache_helper.dart';
import '../../../core/functions/navigation.dart';
import '../../../core/service/service_locator.dart';
import 'onboarding_page_view_widget.dart';

//* steps of logic
//* scroll controller
//* listen pageView
//* update currentPage

class OnboardingViewBody extends StatefulWidget {
  const OnboardingViewBody({super.key});

  @override
  State<OnboardingViewBody> createState() => _OnboardingViewBodyState();
}

class _OnboardingViewBodyState extends State<OnboardingViewBody> {
  late PageController pageController;
  var currentPage = 0;

  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      currentPage = pageController.page!.round();
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: OnboardingPageViewWidget(
              pageController: pageController,
            ),
          ),
          DotsIndicator(
            dotsCount: 2,
            position: 0,
            decorator: DotsDecorator(
              color: currentPage == 1
                  ? AppColors.primaryColor
                  : AppColors.dotsIndicatorColor,
              activeColor: AppColors.primaryColor,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Visibility(
              visible: currentPage == 1 ? true : false,
              maintainState: true,
              maintainAnimation: true,
              maintainSize: true,
              child: CustomButton(
                text: AppStrings.onboardingGetStartedText,
                style: AppTextStyle.Cairo700style16,
                mainAxisAlignment: MainAxisAlignment.center,
                onPressed: () {
                  getIt<CacheHelper>()
                      .saveData(key: "welcomeVisited", value: true);
                  customReplacementNavigate(context, SignupView.routeName);
                },
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.05)
        ],
      ),
    );
  }
}
