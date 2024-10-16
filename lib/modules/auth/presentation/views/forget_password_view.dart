import 'package:flutter/material.dart';
import 'package:fruits_hup/core/widgets/custom_app_bar_widget.dart';
import '../../../../core/utils/app_strings.dart';
import 'bodies/forget_password_body.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});
  static const String routeName = '/ForgetPassword-View';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppStrings.forgottingPassword,
        icon: Icon(Icons.arrow_back_ios_new_rounded),
      ),
      body: ForgetPasswordBody(),
    );
  }
}
