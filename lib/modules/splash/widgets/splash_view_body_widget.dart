import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/functions/navigation.dart';
import '../../../core/utils/assets.dart';
import '../../onboarding/views/onboarding_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    delayedNavigate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset(Assets.assetsImagesSplashPlantImage),
          ],
        ),
        SvgPicture.asset(Assets.assetsImagesSplashLogo),
        SvgPicture.asset(
          Assets.assetsImagesSplashBottomImage,
          fit: BoxFit.fill,
        ),
      ],
    );
  }

  void delayedNavigate() {
    Future.delayed(const Duration(seconds: 3), () {
      customReplacementNavigate(context, OnboardingView.routeName);
    });
  }
}
