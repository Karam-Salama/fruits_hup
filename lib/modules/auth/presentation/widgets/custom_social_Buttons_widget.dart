// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hup/core/utils/assets.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/widgets/custom_btn.dart';
import '../auth_cubits/Sign_In_Cubit/sign_in_cubit.dart';
import '../auth_cubits/Sign_In_Cubit/sign_in_state.dart';
import '../functions/check_sign_In_state.dart';

class CustomSocialButtons extends StatelessWidget {
  CustomSocialButtons({
    super.key,
    required this.text1,
    required this.text2,
    required this.text3,
  });
  String? text1;
  String? text2;
  String? text3;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (BuildContext context, state) {
        checkSignInStateEitherFailOrSuccess(state, context);
      },
      builder: (BuildContext context, state) {
        SignInCubit signInCubit = BlocProvider.of<SignInCubit>(context);
        return Column(
          children: [
            CustomButton(
              imageIcon: Assets.assetsIconsGoogleIcon,
              text: text1!,
              backGroundColor: Color(0xFFF6FBF3),
              borderColor: Color(0xFFDDDFDF),
              onPressed: () {
                signInCubit.signInWithGoogle();
              },
              style: AppTextStyle.Cairo600style13.copyWith(fontSize: 16),
              mainAxisAlignment: MainAxisAlignment.start,
            ),
            const SizedBox(height: 16),
            CustomButton(
              imageIcon: Assets.assetsIconsAppleIcon,
              text: text2!,
              backGroundColor: Color(0xFFF6FBF3),
              borderColor: Color(0xFFDDDFDF),
              onPressed: () {
                signInCubit.signInWithApple();
              },
              style: AppTextStyle.Cairo600style13.copyWith(fontSize: 16),
              mainAxisAlignment: MainAxisAlignment.start,
            ),
            const SizedBox(height: 16),
            CustomButton(
              imageIcon: Assets.assetsIconsFacebookIcon,
              text: text3!,
              backGroundColor: Color(0xFFF6FBF3),
              borderColor: Color(0xFFDDDFDF),
              onPressed: () {
                // signInCubit.signInWithFacebook();
              },
              style: AppTextStyle.Cairo600style13.copyWith(fontSize: 16),
              mainAxisAlignment: MainAxisAlignment.start,
            ),
          ],
        );
      },
    );
  }
}
