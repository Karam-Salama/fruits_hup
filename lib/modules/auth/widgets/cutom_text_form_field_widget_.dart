// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:fruits_hup/core/utils/app_text_styles.dart';

import '../../../../core/utils/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final bool? obscureText;
  final TextInputType keyboardType;
  final Widget? suffixIcon;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final String? Function(String?)? validator;

  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.suffixIcon,
    this.onChanged,
    this.onFieldSubmitted,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      obscureText: obscureText!,
      keyboardType: keyboardType,
      style: AppTextStyle.Cairo600style16.copyWith(color: AppColors.blackColor),
      decoration: InputDecoration(
        enabledBorder: getBorderStyle(),
        focusedBorder: getBorderStyle(),
        border: getBorderStyle(),
        hintText: hintText,
        hintStyle:
            AppTextStyle.Cairo400style13.copyWith(fontWeight: FontWeight.w700),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
        suffixIcon: suffixIcon,
      ),
    );
  }
}

OutlineInputBorder getBorderStyle() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(4),
    borderSide: const BorderSide(
      color: Color(0xFFE6E9EA),
      width: 1.0,
    ),
  );
}
