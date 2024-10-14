import 'package:flutter/material.dart';

import '../../../core/functions/validation.dart';
import '../../../core/utils/app_strings.dart';
import '../../../core/utils/app_text_styles.dart';
import '../../../core/widgets/custom_btn.dart';
import 'cutom_textField.dart';

class CustomForgetPasswordForm extends StatelessWidget {
  const CustomForgetPasswordForm({super.key});

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
          const SizedBox(height: 30),
          CustomButton(
            text: AppStrings.forgetPassword,
            mainAxisAlignment: MainAxisAlignment.center,
            style: AppTextStyle.Cairo700style16,
            onPressed: () async {},
          ),
          const SizedBox(height: 48),
        ],
      ),
    );
  }
}
