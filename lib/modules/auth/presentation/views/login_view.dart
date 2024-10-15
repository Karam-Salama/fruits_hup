import 'package:flutter/material.dart';
import '../../../../core/functions/navigation.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../widgets/custom_have_account_widget.dart';
import '../widgets/custom_login_form_widget.dart';
import '../widgets/custom_or_divider_widget.dart';
import '../widgets/custom_social_Buttons_widget.dart';
import 'signUp_view.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  static const routeName = '/login-view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          AppStrings.login,
          style: AppTextStyle.Cairo700style23.copyWith(fontSize: 19),
        ),
      ),
      body: Padding(
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
      ),
    );
  }
}
