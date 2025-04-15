// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hup/core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/widgets/custom_btn.dart';

import '../auth_cubits/social_auth_cubit/social_cubit.dart';
import '../auth_cubits/social_auth_cubit/social_state.dart';
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
    return BlocConsumer<SignInSocialCubit, SignInSocialState>(
      listener: (BuildContext context, state) {
        checkSignInSocialStateEitherFailOrSuccess(state, context);
      },
      builder: (BuildContext context, state) {
        SignInSocialCubit signInsocialCubit =
            BlocProvider.of<SignInSocialCubit>(context);
        return Column(
          children: [
            CustomButton(
              imageIcon: Assets.assetsIconsGoogleIcon,
              text: text1!,
              backGroundColor: Color(0xFFF6FBF3),
              borderColor: Color(0xFFDDDFDF),
              onPressed: () {
                signInsocialCubit.signInWithGoogle();
              },
              style: AppTextStyle.Cairo600style13.copyWith(fontSize: 16),
              mainAxisAlignment: MainAxisAlignment.start,
            ),
            const SizedBox(height: 16),
            Platform.isIOS
                ? Column(
                    children: [
                      state is SignInSocialLoadingState
                          ? CustomButton(
                              imageIcon: Assets.assetsIconsAppleIcon,
                              text: text2!,
                              backGroundColor: Color(0xFFF6FBF3),
                              borderColor: Color(0xFFDDDFDF),
                              onPressed: () {
                                // signInsocialCubit.signInWithApple();
                              },
                              style: AppTextStyle.Cairo600style13.copyWith(
                                  fontSize: 16),
                              mainAxisAlignment: MainAxisAlignment.start,
                            )
                          : CircularProgressIndicator(
                              color: AppColors.primaryColor),
                      const SizedBox(height: 16),
                    ],
                  )
                : SizedBox(),
            CustomButton(
              imageIcon: Assets.assetsIconsFacebookIcon,
              text: text3!,
              backGroundColor: Color(0xFFF6FBF3),
              borderColor: Color(0xFFDDDFDF),
              onPressed: () {
                signInsocialCubit.signInWithFacebook();
              },
              style: AppTextStyle.Cairo600style13.copyWith(fontSize: 16),
              mainAxisAlignment: MainAxisAlignment.start,
            )
          ],
        );
      },
    );
  }
}
