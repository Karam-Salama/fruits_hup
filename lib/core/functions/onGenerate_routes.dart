import 'package:flutter/material.dart';
import 'package:fruits_hup/modules/auth/views/login_view.dart';
import 'package:fruits_hup/modules/splash/views/splash_view.dart';

import '../../modules/auth/views/forget_password_view.dart';
import '../../modules/auth/views/password_recovery_view.dart';
import '../../modules/auth/views/reset_your_password_view.dart';
import '../../modules/auth/views/signUp_view.dart';
import '../../modules/onboarding/views/onboarding_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => const SplashView());
    case OnboardingView.routeName:
      return MaterialPageRoute(builder: (context) => const OnboardingView());
    case LoginView.routeName:
      return MaterialPageRoute(builder: (context) => const LoginView());
    case SignupView.routeName:
      return MaterialPageRoute(builder: (context) => const SignupView());
    case ForgetPasswordView.routeName:
      return MaterialPageRoute(
          builder: (context) => const ForgetPasswordView());
    case PasswordRecoveryView.routeName:
      return MaterialPageRoute(
          builder: (context) => const PasswordRecoveryView());
    case ResetyourpasswordView.routeName:
      return MaterialPageRoute(
          builder: (context) => const ResetyourpasswordView());

    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
