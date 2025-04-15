import 'package:flutter/material.dart';

import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/custom_home_appBar.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  static const String routeName = 'Notification-View';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            const SliverToBoxAdapter(child: SizedBox(height: 40)),
            SliverToBoxAdapter(
              child: CustomAppBar(
                title: AppStrings.notifications,
                leading: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.arrow_back_ios_new_rounded),
                ),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 12)),
          ],
        ),
      ),
    );
  }
}
