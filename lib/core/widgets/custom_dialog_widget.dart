import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';
import 'custom_btn.dart';

class CustomDialog extends StatelessWidget {
  final IconData? icon;
  final String message;
  final String textButton;
  final String? textButton2;
  final VoidCallback? onpressed;
  final VoidCallback? onpressed2;
  final Widget? leading;

  const CustomDialog({
    super.key,
    required this.message,
    this.icon,
    required this.textButton,
    this.textButton2,
    required this.onpressed,
    this.leading,
    this.onpressed2,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      backgroundColor: Colors.white,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          leading ??
              Icon(
                icon,
                color: AppColors.primaryColor,
                size: 60,
              ),
          const SizedBox(height: 16),
          Text(
            message,
            style: AppTextStyle.Cairo700style16.copyWith(
                color: AppColors.blackColor),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: CustomButton(
                  style: AppTextStyle.Cairo700style16,
                  mainAxisAlignment: MainAxisAlignment.center,
                  text: textButton,
                  backGroundColor: AppColors.primaryColor,
                  onPressed: onpressed!,
                ),
              ),
              textButton2 == null ? const SizedBox() : SizedBox(width: 16),
              textButton2 == null
                  ? const SizedBox()
                  : Expanded(
                      child: CustomButton(
                        style: AppTextStyle.Cairo700style16.copyWith(
                          color: AppColors.primaryColor,
                        ),
                        mainAxisAlignment: MainAxisAlignment.center,
                        text: textButton2,
                        backGroundColor: AppColors.whiteColor,
                        borderColor: AppColors.primaryColor,
                        onPressed: onpressed2!,
                      ),
                    ),
            ],
          ),
        ],
      ),
    );
  }
}
