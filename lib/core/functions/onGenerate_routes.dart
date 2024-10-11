import 'package:flutter/material.dart';
import 'package:fruits_hup/modules/splash/views/splash_view.dart';

import '../../modules/onboarding/views/onboarding_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => const SplashView());
    case OnboardingView.routeName:
      return MaterialPageRoute(builder: (context) => const OnboardingView());
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
