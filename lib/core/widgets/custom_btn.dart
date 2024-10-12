import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_constants.dart';
import '../utils/app_text_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.backGroundColor,
    this.borderColor,
    required this.text,
    required this.onPressed,
    this.icon,
  });

  final Color? backGroundColor;
  final Color? borderColor;
  final String? text;
  final VoidCallback? onPressed;
  final Icon? icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: SizedBox(
        width: double.infinity,
        height: kHeightBottom,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: backGroundColor ?? AppColors.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(kRaduisBorder),
              side: BorderSide(color: borderColor ?? Colors.transparent),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) ...[
                icon!,
                const SizedBox(width: 8),
              ],
              Text(
                text!,
                style: AppTextStyle.Cairo700style16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
