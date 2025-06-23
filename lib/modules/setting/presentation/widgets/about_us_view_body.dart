import 'package:flutter/material.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/custom_home_appBar.dart';

import 'about_us_main_section.dart';

class AboutUsViewBody extends StatelessWidget {
  const AboutUsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(16),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: CustomAppBar(
                title: AppStrings.aboutDeveloper,
                isVisibleTrailing: false,
                isVisibleLeading: false,
              ),
            ),
            SliverToBoxAdapter(child: AboutMeMainSection()),
          ],
        ),
      ),
    );
  }
}
