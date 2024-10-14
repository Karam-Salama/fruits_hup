import 'package:flutter/material.dart';

import '../../../core/utils/app_strings.dart';
import '../../../core/utils/app_text_styles.dart';
import '../../../core/widgets/custom_header_text.dart';
import '../widgets/custom_forget_password_form_widget.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});
  static const String routeName = '/ForgetPassword-View';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            AppStrings.forgottingPassword,
            style: AppTextStyle.Cairo700style23.copyWith(fontSize: 19),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new_rounded),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(child: SizedBox(height: 16)),
              SliverToBoxAdapter(
                child: CustomHeaderText(
                  text1: AppStrings.forgotPasswordSubTitle,
                  textAlign1: TextAlign.start,
                  styleText1: AppTextStyle.Cairo600style16,
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 31)),
              const SliverToBoxAdapter(child: CustomForgetPasswordForm()),
              const SliverToBoxAdapter(child: SizedBox(height: 24))
            ],
          ),
        ));
  }
}
