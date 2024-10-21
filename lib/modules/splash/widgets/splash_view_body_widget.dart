import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_hup/modules/home/presentation/views/home_view.dart';

import '../../../core/database/cache/cache_helper.dart';
import '../../../core/functions/navigation.dart';
import '../../../core/service/service_locator.dart';
import '../../../core/utils/assets.dart';
import '../../auth/presentation/views/signIn_view.dart';
import '../../onboarding/views/onboarding_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    bool welcomeVisited =
        getIt<CacheHelper>().getData(key: "welcomeVisited") ?? false;
    if (welcomeVisited == true) {
      FirebaseAuth.instance.currentUser == null
          ? delayedNavigate(SignInView.routeName)
          : FirebaseAuth.instance.currentUser!.emailVerified == true
              ? delayedNavigate(HomeView.routeName)
              : delayedNavigate(SignInView.routeName);
    } else {
      delayedNavigate(OnboardingView.routeName);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
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

  void delayedNavigate(String routeName) {
    Future.delayed(const Duration(seconds: 2), () {
      customReplacementNavigate(context, routeName);
    });
  }
}
