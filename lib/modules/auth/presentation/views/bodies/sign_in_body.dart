import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hup/modules/auth/presentation/auth_cubits/social_auth_cubit/social_cubit.dart';

import '../../../../../core/functions/navigation.dart';
import '../../../../../core/service/service_locator.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../domain/repos/auth_repo.dart';
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
                customReplacementNavigate(context, SignupView.routeName);
              },
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 24)),
          SliverToBoxAdapter(child: CustomOrDivider(text: AppStrings.or)),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),
          SliverToBoxAdapter(
            child: BlocProvider(
              create: (context) => SignInSocialCubit(getIt<AuthRepo>()),
              child: CustomSocialButtons(
                text1: AppStrings.loginWithGoogle,
                text2: AppStrings.loginWithApple,
                text3: AppStrings.loginWithFacebook,
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 66)),
        ],
      ),
    );
  }
}
