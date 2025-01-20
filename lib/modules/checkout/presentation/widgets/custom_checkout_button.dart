import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_home_appBar.dart';

class CustomCheckoutButton extends StatelessWidget {
  const CustomCheckoutButton({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      title: title,
      isVisibleTrailing: false,
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: Icon(Icons.arrow_back_ios_new_rounded),
      ),
    );
  }
}
