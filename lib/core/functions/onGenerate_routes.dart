import 'package:flutter/material.dart';
import 'package:fruits_hup/modules/auth/presentation/views/signIn_view.dart';
import 'package:fruits_hup/modules/splash/views/splash_view.dart';

import '../../modules/auth/presentation/views/forget_password_view.dart';

import '../../modules/auth/presentation/views/signUp_view.dart';
import '../../modules/home/presentation/views/main_view.dart';
import '../../modules/onboarding/views/onboarding_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => const SplashView());
    case OnboardingView.routeName:
      return MaterialPageRoute(builder: (context) => const OnboardingView());
    case SignInView.routeName:
      return MaterialPageRoute(builder: (context) => const SignInView());
    case SignupView.routeName:
      return MaterialPageRoute(builder: (context) => const SignupView());
    case ForgetPasswordView.routeName:
      return MaterialPageRoute(
          builder: (context) => const ForgetPasswordView());
    case MainView.routeName:
      return MaterialPageRoute(builder: (context) => const MainView());
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
