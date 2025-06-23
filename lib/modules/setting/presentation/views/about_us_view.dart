import 'package:flutter/material.dart';

import '../widgets/about_us_view_body.dart';

class AboutUsView extends StatelessWidget {
  const AboutUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: AboutUsViewBody()),
    );
  }
}
