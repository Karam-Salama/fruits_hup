import 'package:flutter/material.dart';
import 'package:fruits_hup/modules/auth/presentation/auth_cubits/Sign_Up_Cubit/sign_up_state.dart';
import 'package:fruits_hup/modules/auth/presentation/views/signIn_view.dart';

import '../../../../core/functions/navigation.dart';
import '../../../../core/widgets/custom_dialog_widget.dart';
import 'build_custom_dialog.dart';

void checkSignUpStateEitherFailOrSuccess(
    SignUpState state, BuildContext context) {
  if (state is SignUpSuccessState) {
    buildCustomDialog(
      context,
      CustomDialog(
        icon: Icons.check_circle,
        message: 'برجاء تأكيد التسجيل عن طريق البريد الإلكتروني',
        textButton: 'حسناً',
        onpressed: () {
          customReplacementNavigate(context,SignInView.routeName);
        },
      ),
    );
  } else if (state is SignUpErrorState) {
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
