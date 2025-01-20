import 'package:flutter/material.dart';
import 'package:fruits_hup/core/widgets/custom_home_appBar.dart';

class CustomCartAppBar extends StatelessWidget {
  final String title;
  const CustomCartAppBar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      title: title,
      isVisibleTrailing: false,
      isVisibleLeading: false,
    );
  }
}
