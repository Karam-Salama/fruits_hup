import 'package:flutter/material.dart';
import '../utils/app_text_styles.dart';

class CustomHeaderText extends StatelessWidget {
  const CustomHeaderText({
    super.key,
    required this.text1,
    required this.styleText1,
    required this.textAlign1,
    this.onpress,
    this.text2,
    this.textAlign2,
  });

  final String text1;
  final VoidCallback? onpress;
  final String? text2;
  final TextAlign textAlign1;
  final TextAlign? textAlign2;
  final TextStyle? styleText1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: InkWell(
              onTap: onpress,
              child: Text(
                text1,
                style: styleText1,
                textAlign: textAlign1,
              ),
            ),
          ),
          if (text2 != null)
            Expanded(
              child: Text(
                text2!,
                style: AppTextStyle.Cairo400style13,
                textAlign: textAlign2,
              ),
            ),
        ],
      ),
    );
  }
}
