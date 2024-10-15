import 'package:flutter/material.dart';
import 'package:fruits_hup/core/functions/navigation.dart';
import 'package:fruits_hup/core/widgets/custom_header_text.dart';

import '../../../../core/functions/validation.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/widgets/custom_btn.dart';
import '../views/forget_password_view.dart';
import 'cutom_text_form_field_widget_.dart';

class CustomLoginForm extends StatelessWidget {
  const CustomLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: [
        CustomTextFormField(
          hintText: AppStrings.Email,
          keyboardType: TextInputType.emailAddress,
          onChanged: (email) {},
          validator: Validation.validateEmail,
        ),
        const SizedBox(height: 16),
        CustomTextFormField(
          hintText: AppStrings.password,
          keyboardType: TextInputType.visiblePassword,
          onChanged: (password) {},
          suffixIcon: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.remove_red_eye,
              color: AppColors.greyColor,
            ),
          ),
        ),
        const SizedBox(height: 8),
        CustomHeaderText(
          onpress: () {
            customNavigate(context, ForgetPasswordView.routeName);
          },
          text1: AppStrings.forgotPassword,
          textAlign1: TextAlign.end,
          styleText1: AppTextStyle.Cairo600style13.copyWith(
            color: AppColors.secondaryColor,
          ),
        ),
        const SizedBox(height: 33),
        CustomButton(
          text: AppStrings.login,
          onPressed: () {},
          style: AppTextStyle.Cairo700style16,
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ],
    ));
  }
}
