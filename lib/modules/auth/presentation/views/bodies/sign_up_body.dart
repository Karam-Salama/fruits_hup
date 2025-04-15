import 'package:flutter/material.dart';
import 'package:fruits_hup/core/functions/navigation.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../widgets/custom_have_account_widget.dart';
import '../../widgets/custom_signUp_form_widget.dart';
import '../signIn_view.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const SliverToBoxAdapter(child: SizedBox(height: 24)),
          const SliverToBoxAdapter(child: CustomSignUpForm()),
          const SliverToBoxAdapter(child: SizedBox(height: 24)),
          SliverToBoxAdapter(
            child: HaveAccountWidget(
              textPart1: AppStrings.alreadyHaveAccount,
              textPart2: AppStrings.login,
              onPress: () {
                customReplacementNavigate(context, SignInView.routeName);
              },
            ),
          ),
        ],
      ),
    );
  }
}
