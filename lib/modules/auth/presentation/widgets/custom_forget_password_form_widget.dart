import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/functions/validation.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/widgets/custom_btn.dart';
import '../auth_cubits/reset_pass_Cubit/reset_password_cubit.dart';
import '../auth_cubits/reset_pass_Cubit/reset_password_state.dart';
import '../functions/check_reset_password_state.dart';
import 'cutom_text_form_field_widget_.dart';

class CustomForgetPasswordForm extends StatefulWidget {
  const CustomForgetPasswordForm({super.key});

  @override
  State<CustomForgetPasswordForm> createState() =>
      _CustomForgetPasswordFormState();
}

class _CustomForgetPasswordFormState extends State<CustomForgetPasswordForm> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
      listener: (context, state) {
        checkResetPasswordStateEitherFailOrSuccess(state, context);
      },
      builder: (context, state) {
        ResetPasswordCubit resetPasswordCubit =
            BlocProvider.of<ResetPasswordCubit>(context);
        return Form(
          key: resetPasswordCubit.resetPasswordFormKey,
          autovalidateMode: resetPasswordCubit.resetPasswordAutoValidateMode,
          child: Column(
            children: [
              CustomTextFormField(
                hintText: AppStrings.Email,
                keyboardType: TextInputType.emailAddress,
                onChanged: (email) {
                  resetPasswordCubit.email = email;
                },
                validator: Validation.validateEmail,
              ),
              const SizedBox(height: 30),
              state is ResetPasswordLoadingState
                  ? CustomButton(
                      text: AppStrings.forgetPassword,
                      mainAxisAlignment: MainAxisAlignment.center,
                      style: AppTextStyle.Cairo700style16,
                      onPressed: () async {
                        if (resetPasswordCubit
                            .resetPasswordFormKey.currentState!
                            .validate()) {
                          resetPasswordCubit.resetPasswordFormKey.currentState!
                              .save();
                          resetPasswordCubit
                              .resetPassword(resetPasswordCubit.email!);
                        } else {
                          setState(() {
                            resetPasswordCubit.resetPasswordAutoValidateMode =
                                AutovalidateMode.always;
                          });
                        }
                      },
                    )
                  : CircularProgressIndicator(color: AppColors.primaryColor),
              const SizedBox(height: 48),
            ],
          ),
        );
      },
    );
  }
}
