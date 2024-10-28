import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hup/core/functions/navigation.dart';
import 'package:fruits_hup/core/widgets/custom_header_text.dart';
import '../../../../core/functions/validation.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/widgets/custom_btn.dart';
import '../auth_cubits/Sign_In_Cubit/sign_in_cubit.dart';
import '../auth_cubits/Sign_In_Cubit/sign_in_state.dart';
import '../functions/check_sign_In_state.dart';
import '../views/forget_password_view.dart';
import 'cutom_text_form_field_widget_.dart';

class CustomLoginForm extends StatefulWidget {
  const CustomLoginForm({super.key});

  @override
  State<CustomLoginForm> createState() => _CustomLoginFormState();
}

class _CustomLoginFormState extends State<CustomLoginForm> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) {
        checkSignInStateEitherFailOrSuccess(state, context);
      },
      builder: (context, state) {
        SignInCubit signInCubit = BlocProvider.of<SignInCubit>(context);
        return Form(
            key: signInCubit.signInFormKey,
            autovalidateMode: signInCubit.SignInAutoValidateMode,
            child: Column(
              children: [
                CustomTextFormField(
                  hintText: AppStrings.Email,
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (email) {
                    signInCubit.email = email;
                  },
                  validator: Validation.validateEmail,
                ),
                const SizedBox(height: 16),
                CustomTextFormField(
                  hintText: AppStrings.password,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: !signInCubit.isPasswordVisible,
                  suffixIcon: IconButton(
                    icon: Icon(
                      signInCubit.isPasswordVisible
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      color: AppColors.greyColor,
                    ),
                    onPressed: () {
                      signInCubit.togglePasswordVisibility();
                    },
                  ),
                  validator: Validation.validatePassword,
                  onSaved: (password) {
                    signInCubit.password = password;
                  },
                ),
                const SizedBox(height: 8),
                CustomHeaderText(
                  onpress1: () {
                    customNavigate(context, ForgetPasswordView.routeName);
                  },
                  text1: AppStrings.forgotPassword,
                  textAlign1: TextAlign.end,
                  styleText1: AppTextStyle.Cairo600style13.copyWith(
                    color: AppColors.secondaryColor,
                  ),
                ),
                const SizedBox(height: 33),
                state is SignInLoadingState
                    ? CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      )
                    : CustomButton(
                        text: AppStrings.login,
                        onPressed: () {
                          if (signInCubit.signInFormKey.currentState!
                              .validate()) {
                            signInCubit.signInFormKey.currentState!.save();
                            signInCubit.signInWithEmailAndPassword(
                              signInCubit.email!,
                              signInCubit.password!,
                            );
                          } else {
                            setState(() {
                              signInCubit.SignInAutoValidateMode =
                                  AutovalidateMode.always;
                            });
                          }
                        },
                        style: AppTextStyle.Cairo700style16,
                        mainAxisAlignment: MainAxisAlignment.center,
                      ),
              ],
            ));
      },
    );
  }
}
