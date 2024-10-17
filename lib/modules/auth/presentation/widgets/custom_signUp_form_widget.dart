import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/functions/validation.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/widgets/custom_btn.dart';
import '../../../../core/widgets/custom_dialog_widget.dart';
import '../auth_cubits/Sign_Up_Cubit/sign_up_cubit.dart';
import '../auth_cubits/Sign_Up_Cubit/sign_up_state.dart';
import '../functions/build_custom_dialog.dart';
import '../functions/check_signUp_state.dart';
import 'custom_terms_and_conds_widget.dart';
import 'cutom_text_form_field_widget_.dart';

class CustomSignUpForm extends StatefulWidget {
  const CustomSignUpForm({super.key});

  @override
  State<CustomSignUpForm> createState() => _CustomSignUpFormState();
}

class _CustomSignUpFormState extends State<CustomSignUpForm> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (BuildContext context, state) {
        checkSignUpStateEitherFailOrSuccess(state, context);
      },
      builder: (context, state) {
        SignUpCubit signUpCubit = BlocProvider.of<SignUpCubit>(context);
        return Form(
          key: signUpCubit.signUpFormKey,
          autovalidateMode: signUpCubit.SignUpAutoValidateMode,
          child: Column(
            children: [
              CustomTextFormField(
                hintText: AppStrings.fullName,
                keyboardType: TextInputType.name,
                onSaved: (name) {
                  signUpCubit.name = name;
                },
                validator: Validation.validateName,
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                hintText: AppStrings.Email,
                keyboardType: TextInputType.emailAddress,
                onSaved: (email) {
                  signUpCubit.emailAddress = email;
                },
                validator: Validation.validateEmail,
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                hintText: AppStrings.password,
                keyboardType: TextInputType.visiblePassword,
                obscureText: !signUpCubit.isPasswordVisible,
                suffixIcon: IconButton(
                  icon: Icon(
                    signUpCubit.isPasswordVisible
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: AppColors.greyColor,
                  ),
                  onPressed: () {
                    signUpCubit.togglePasswordVisibility();
                  },
                ),
                validator: Validation.validatePassword,
                onSaved: (password) {
                  signUpCubit.password = password;
                },
              ),
              const SizedBox(height: 8),
              TermsAndConditionsWidget(),
              const SizedBox(height: 30),
              state is SignUpLoadingState
                  ? const CircularProgressIndicator(
                      color: AppColors.primaryColor)
                  : CustomButton(
                      text: AppStrings.createAccount,
                      style: AppTextStyle.Cairo700style16,
                      mainAxisAlignment: MainAxisAlignment.center,
                      backGroundColor: signUpCubit.isTermsAndConditionsAccepted!
                          ? null
                          : AppColors.lightGreyColor,
                      onPressed: () async {
                        if (signUpCubit.isTermsAndConditionsAccepted!) {
                          handleSignUp(signUpCubit, context);
                        } else {
                          buildCustomDialog(
                            context,
                            const CustomDialog(
                              icon: Icons.warning_amber_rounded,
                              message: 'يجب عليك الموافقة على الشروط والأحكام',
                              textButton: 'جرب مرة اخرى',
                            ),
                          );
                        }
                      },
                    ),
            ],
          ),
        );
      },
    );
  }

  void handleSignUp(SignUpCubit signUpCubit, BuildContext context) {
    if (signUpCubit.signUpFormKey.currentState!.validate()) {
      signUpCubit.signUpFormKey.currentState!.save();
      context.read<SignUpCubit>().createUserWithEmailAndPassword(
            signUpCubit.emailAddress!,
            signUpCubit.password!,
            signUpCubit.name!,
          );
    } else {
      setState(() {
        signUpCubit.SignUpAutoValidateMode = AutovalidateMode.always;
      });
    }
  }
}
