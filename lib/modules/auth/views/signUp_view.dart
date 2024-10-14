import 'package:flutter/material.dart';
import 'package:fruits_hup/modules/auth/views/login_view.dart';

import '../../../core/functions/navigation.dart';
import '../../../core/utils/app_strings.dart';
import '../../../core/utils/app_text_styles.dart';
import '../../../core/widgets/custom_header_text.dart';
import '../widgets/custom_have_account_widget.dart';
import '../widgets/custom_signUp_form_widget.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});
  static const routeName = '/signup-view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const SliverToBoxAdapter(child: SizedBox(height: 60)),
          SliverToBoxAdapter(
            child: CustomHeaderText(
              text1: AppStrings.register,
              textAlign1: TextAlign.center,
              styleText1: AppTextStyle.Cairo700style23.copyWith(fontSize: 19),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 24)),
          const SliverToBoxAdapter(child: CustomSignUpForm()),
          const SliverToBoxAdapter(child: SizedBox(height: 24)),
          SliverToBoxAdapter(
            child: HaveAccountWidget(
                textPart1: AppStrings.alreadyHaveAccount,
                textPart2: AppStrings.login,
                onPress: () {
                  customReplacementNavigate(context, LoginView.routeName);
                }),
          ),
        ],
      ),
    ));
  }
}
