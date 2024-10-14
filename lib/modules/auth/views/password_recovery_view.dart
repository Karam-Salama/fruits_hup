import 'package:flutter/material.dart';

import '../../../core/utils/app_strings.dart';
import '../../../core/utils/app_text_styles.dart';
import '../../../core/widgets/custom_header_text.dart';

class PasswordRecoveryView extends StatelessWidget {
  const PasswordRecoveryView({super.key});
  static const String routeName = "/passwordRecovery-View";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            const SliverToBoxAdapter(child: SizedBox(height: 60)),
            SliverToBoxAdapter(
              child: CustomHeaderText(
                text1: AppStrings.checkYourEmailTitle,
                textAlign1: TextAlign.center,
                styleText1: AppTextStyle.Cairo700style23.copyWith(fontSize: 19),
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 16)),
            SliverToBoxAdapter(
              child: CustomHeaderText(
                text1: AppStrings.checkYourNumberSubTitle,
                textAlign1: TextAlign.start,
                styleText1: AppTextStyle.Cairo600style16,
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 31)),
          ],
        ),
      ),
    );
  }
}

