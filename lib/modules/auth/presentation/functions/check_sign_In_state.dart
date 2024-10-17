import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../core/functions/navigation.dart';
import '../../../../core/widgets/custom_dialog_widget.dart';
import '../../../home/presentation/views/home_view.dart';
import '../auth_cubits/Sign_In_Cubit/sign_in_state.dart';
import 'build_custom_dialog.dart';

void checkSignInStateEitherFailOrSuccess(
    SignInState state, BuildContext context) {
  if (state is SignInSuccessState) {
    if (FirebaseAuth.instance.currentUser!.emailVerified) {
      buildCustomDialog(
        context,
        CustomDialog(
          icon: Icons.check_circle,
          message: 'تم تسجيل الدخول بنجاح',
          textButton: 'حسناً',
          onpressed: () {
            customReplacementNavigate(context, HomeView.routeName);
          },
        ),
      );
    }else{
      buildCustomDialog(
        context,
        CustomDialog(
          icon: Icons.error,
          message: 'برجاء تفعيل حسابك',
          textButton: 'حسناً',
          onpressed: () {
            Navigator.pop(context);
            },
        ),
      );
    }
  } else if (state is SignInErrorState) {
    buildCustomDialog(
      context,
      CustomDialog(
        icon: Icons.error,
        message: state.errorMessage,
        textButton: 'جرب مرة اخرى',
        onpressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
