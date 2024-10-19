import 'package:flutter/material.dart';
import 'package:fruits_hup/modules/auth/presentation/views/signIn_view.dart';

import '../../../../core/functions/navigation.dart';
import '../../../../core/widgets/custom_dialog_widget.dart';
import '../auth_cubits/reset_pass_Cubit/reset_password_state.dart';
import 'build_custom_dialog.dart';

void checkResetPasswordStateEitherFailOrSuccess(
  ResetPasswordState state, BuildContext context) {
  if (state is ResetPasswordSuccessState) {
    buildCustomDialog(
      context,
      CustomDialog(
        icon: Icons.check_circle,
        message: 'افحص بريدك الإلكتروني لتغير كلمة المرور',
        textButton: 'حسناً',
        onpressed: () {
          customReplacementNavigate(context, SignInView.routeName);
        },
      ),
    );
  } else if (state is ResetPasswordErrorState)
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
