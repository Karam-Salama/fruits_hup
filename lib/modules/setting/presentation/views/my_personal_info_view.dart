import 'package:flutter/material.dart';

import '../widgets/my_personal_info_view_body.dart';

class MyPersonalInfoView extends StatelessWidget {
  const MyPersonalInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: MyPersonalInfoViewBody()),
    );
  }
}
