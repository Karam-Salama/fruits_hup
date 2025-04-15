import 'package:flutter/material.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/custom_header_text.dart';

class ResetYourPasswordBody extends StatelessWidget {
  const ResetYourPasswordBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const SliverToBoxAdapter(child: SizedBox(height: 60)),
          SliverToBoxAdapter(
            child: CustomHeaderText(
              text1: AppStrings.newPassword,
              textAlign1: TextAlign.center,
              styleText1: AppTextStyle.Cairo700style23.copyWith(fontSize: 19),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 16)),
          SliverToBoxAdapter(
            child: CustomHeaderText(
              text1: AppStrings.createNewPassword,
              textAlign1: TextAlign.start,
              styleText1: AppTextStyle.Cairo600style16,
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 31)),
        ],
      ),
    );
  }
}
