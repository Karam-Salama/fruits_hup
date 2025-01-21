import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hup/core/functions/validation.dart';
import 'package:fruits_hup/core/utils/app_strings.dart';

import '../../../auth/presentation/widgets/cutom_text_form_field_widget_.dart';

class AddressInputSection extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final ValueListenable<AutovalidateMode> valueListenable;
  const AddressInputSection(
      {super.key, required this.formKey, required this.valueListenable});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: ValueListenableBuilder<AutovalidateMode>(
          valueListenable: valueListenable,
          builder: (context, value, child) => Form(
            key: formKey,
            autovalidateMode: value,
            child: Column(
              children: [
                const SizedBox(height: 24),
                CustomTextFormField(
                  onSaved: (value) {},
                  hintText: AppStrings.fullName,
                  keyboardType: TextInputType.text,
                  validator: Validation.validateName,
                ),
                const SizedBox(height: 16),
                CustomTextFormField(
                  onSaved: (value) {},
                  hintText: AppStrings.Email,
                  keyboardType: TextInputType.emailAddress,
                  validator: Validation.validateEmail,
                ),
                const SizedBox(height: 16),
                CustomTextFormField(
                  onSaved: (value) {},
                  hintText: AppStrings.address,
                  keyboardType: TextInputType.text,
                  validator: Validation.validateName,
                ),
                const SizedBox(height: 16),
                CustomTextFormField(
                  onSaved: (value) {},
                  hintText: AppStrings.city,
                  keyboardType: TextInputType.text,
                  validator: Validation.validateName,
                ),
                const SizedBox(height: 16),
                CustomTextFormField(
                  onSaved: (value) {},
                  hintText: AppStrings.floor,
                  keyboardType: TextInputType.text,
                  validator: Validation.validateName,
                ),
                const SizedBox(height: 16),
                CustomTextFormField(
                  onSaved: (value) {},
                  hintText: AppStrings.phone,
                  keyboardType: TextInputType.number,
                  validator: Validation.validatePhone,
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
