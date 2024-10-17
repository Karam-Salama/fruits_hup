import 'package:flutter/material.dart';
import '../utils/app_text_styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.icon, this.onPressed,
  });

  final String title;
  final Icon? icon;

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text(
        title,
        style: AppTextStyle.Cairo700style23.copyWith(fontSize: 19),
      ),
      leading: icon != null
          ? IconButton(
              onPressed: onPressed ?? () => Navigator.pop(context),
              icon: icon!,
            )
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
