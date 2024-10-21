import 'package:flutter/material.dart';
import 'package:fruits_hup/core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';

class HaveAccountWidget extends StatelessWidget {
  const HaveAccountWidget({
    super.key,
    required this.textPart1,
    required this.textPart2,
    required this.onPress,
  });

  final String textPart1;
  final String textPart2;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPress,
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: textPart1,
              style: AppTextStyle.Cairo600style16,
            ),
            const WidgetSpan(
              child: SizedBox(width: 5),
            ),
            TextSpan(
              text: textPart2,
                style: AppTextStyle.Cairo600style16.copyWith(
                  color: AppColors.primaryColor,
                ),
            ),
          ],
        ),
      ),
    );
  }
}


/**
 * 
 * 
 */