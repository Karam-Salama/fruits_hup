import 'package:flutter/material.dart';
import 'package:fruits_hup/core/utils/app_strings.dart';

import '../../../../core/service/service_firebase_auth.dart';
import '../../../../core/widgets/custom_app_bar_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const String routeName = '/home-View';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppStrings.home,
        icon: const Icon(Icons.logout),
        onPressed: () {
          FirebaseAuthService().signOut();
          Navigator.pop(context);
        },
      ),
    );
  }
}
