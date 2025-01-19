import 'package:flutter/material.dart';

import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/widgets/custom_btn.dart';

class CustomCartButton extends StatelessWidget {
  const CustomCartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 16,
      right: 16,
      bottom: MediaQuery.sizeOf(context).height * .05,
      child: CustomButton(
        mainAxisAlignment: MainAxisAlignment.center,
        onPressed: () {},
        text: "الدفع  120جنيه",
        style: AppTextStyle.Cairo700style16,
        padding: 16,
      ),
    );
  }
}
