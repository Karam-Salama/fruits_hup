import 'package:flutter/material.dart';
import 'package:fruits_hup/core/widgets/custom_home_appBar.dart';
import '../../../../core/utils/app_strings.dart';
import 'logout_btn_bloc_consumer.dart';
import 'setting_footer_section.dart';
import 'setting_header_section.dart';
import 'setting_main_section.dart';

class SettingViewBody extends StatelessWidget {
  const SettingViewBody({super.key});

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
                title: AppStrings.myAccount,
                isVisibleTrailing: false,
                isVisibleLeading: false,
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 16)),
            SliverToBoxAdapter(child: SettingHeaderSection()),
            const SliverToBoxAdapter(child: SizedBox(height: 24)),
            SliverToBoxAdapter(child: SettingMainSection()),
            const SliverToBoxAdapter(child: SizedBox(height: 22)),
            SliverToBoxAdapter(child: SettingFooterSection()),
          ],
        ),
      ),
      bottomNavigationBar: LogoutBtnBlocConsumer(),
    );
  }
}
