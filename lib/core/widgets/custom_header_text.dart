import 'package:flutter/material.dart';
import 'package:fruits_hup/core/utils/app_colors.dart';
import '../utils/app_text_styles.dart';

class CustomHeaderText extends StatelessWidget {
  CustomHeaderText({
    super.key,
    required this.text1,
    required this.styleText1,
    required this.textAlign1,
    this.onpress1,
    this.text2,
    this.textAlign2,
    this.onpress2,
    this.padding,
  });

  final String text1;
  final VoidCallback? onpress1;
  final VoidCallback? onpress2;
  final String? text2;
  final TextAlign textAlign1;
  final TextAlign? textAlign2;
  final TextStyle? styleText1;
  EdgeInsetsGeometry? padding = EdgeInsets.symmetric(horizontal: 18.0);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.symmetric(horizontal: 18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: InkWell(
              onTap: onpress1,
              child: Text(
                text1,
                style: styleText1,
                textAlign: textAlign1,
              ),
            ),
          ),
          if (text2 != null)
            Expanded(
              child: InkWell(
                splashColor: AppColors.primaryColor.withOpacity(0.3),
                highlightColor: AppColors.primaryColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8.0),
                onTap: onpress2,
                child: Text(
                  text2!,
                  style: AppTextStyle.Cairo400style13,
                  textAlign: textAlign2,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
