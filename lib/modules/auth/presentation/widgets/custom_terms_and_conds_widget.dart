import 'package:flutter/material.dart';
import 'package:fruits_hup/core/utils/app_colors.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_text_styles.dart';
import 'custom_checkbox_widget.dart';

class TermsAndConditionsWidget extends StatelessWidget {
  const TermsAndConditionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(14, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Transform.translate(
            offset: Offset(0, -6),
            child: CustomCheckBox(),
          ),
          Flexible(
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                      text: AppStrings.acceptTerms,
                      style:
                          AppTextStyle.Cairo600style16.copyWith(fontSize: 13)),
                  const WidgetSpan(
                    child: SizedBox(
                      width: 5,
                    ),
                  ),
                  TextSpan(
                    text: AppStrings.terms,
                    style: AppTextStyle.Cairo600style13.copyWith(
                      color: AppColors.secondaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
