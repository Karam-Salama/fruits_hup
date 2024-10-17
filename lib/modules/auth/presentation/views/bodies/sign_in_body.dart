import 'package:flutter/material.dart';

import '../../../../../core/functions/navigation.dart';
import '../../../../../core/utils/app_strings.dart';
import '../signUp_view.dart';
import '../../widgets/custom_have_account_widget.dart';
import '../../widgets/custom_signIn_form_widget.dart';
import '../../widgets/custom_or_divider_widget.dart';
import '../../widgets/custom_social_Buttons_widget.dart';

class SignInBody extends StatelessWidget {
  const SignInBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const SliverToBoxAdapter(child: SizedBox(height: 24)),
          const SliverToBoxAdapter(child: CustomLoginForm()),
          const SliverToBoxAdapter(child: SizedBox(height: 24)),
          SliverToBoxAdapter(
            child: HaveAccountWidget(
              textPart1: AppStrings.dontHaveAccount,
              textPart2: AppStrings.makeAnAccount,
              onPress: () {
                customNavigate(context, SignupView.routeName);
              },
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 24)),
          SliverToBoxAdapter(child: CustomOrDivider(text: AppStrings.or)),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),
          SliverToBoxAdapter(
            child: CustomSocialButtons(
              text1: AppStrings.loginWithGoogle,
              text2: AppStrings.loginWithApple,
              text3: AppStrings.loginWithFacebook,
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 66)),
        ],
      ),
    );
  }
}
