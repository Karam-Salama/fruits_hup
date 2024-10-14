import 'package:flutter/material.dart';

import '../../../core/functions/validation.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_strings.dart';
import '../../../core/utils/app_text_styles.dart';
import '../../../core/widgets/custom_btn.dart';
import 'custom_terms_and_conds_widget.dart';
import 'cutom_textField.dart';

class CustomSignUpForm extends StatelessWidget {
  const CustomSignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          CustomTextFormField(
            hintText: AppStrings.fullName,
            keyboardType: TextInputType.emailAddress,
            onChanged: (fullName) {},
            // validator: Validation.validateFullName,
          ),
          const SizedBox(height: 16),
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
                Icons.visibility_outlined,
                color: AppColors.greyColor,
              ),
            ),
          ),
          const SizedBox(height: 8),
          TermsAndConditionsWidget(),
          const SizedBox(height: 30),
          CustomButton(
            text: AppStrings.createAccount,
            backGroundColor: AppColors.transparent,
            borderColor: AppColors.primaryColor,
            onPressed: () async {},
            style: AppTextStyle.Cairo700style16,
          mainAxisAlignment: MainAxisAlignment.center,
          ),
        ],
      ),
    );
  }
}
