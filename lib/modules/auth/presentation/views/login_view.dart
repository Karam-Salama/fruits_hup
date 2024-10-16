import 'package:flutter/material.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/custom_app_bar_widget.dart';
import 'bodies/sign_in_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  static const routeName = '/login-view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: AppStrings.login),
      body: SignInBody(),
    );
  }
}
