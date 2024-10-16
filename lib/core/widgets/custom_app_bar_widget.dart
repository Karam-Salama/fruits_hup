import 'package:flutter/material.dart';

import '../utils/app_text_styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.icon,
  });
  final String title;
  final Icon? icon;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text(
        title,
        style: AppTextStyle.Cairo700style23.copyWith(fontSize: 19),
      ),
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: icon!,
      ),
    );
  }

  @override
  Size get preferredSize => throw UnimplementedError();
}
