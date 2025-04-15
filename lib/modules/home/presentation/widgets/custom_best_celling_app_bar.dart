import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_home_appBar.dart';

class CustomBestCellingAppBar extends StatelessWidget {
  const CustomBestCellingAppBar({super.key,required this.title, required this.isVisible});
  final bool isVisible;
  final String title;
  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      title: title,
      leading: Visibility(
        visible: isVisible,
        child: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),
    );
  }
}
