import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

void customReplacementNavigate(BuildContext context, String route) {
  Navigator.pushReplacementNamed(context, route);
}

void customNavigate(BuildContext context, String route) {
  Navigator.pushNamed(context, route);
}

void CustomPersistentNavBarNavigation(
    BuildContext context, Widget screen, bool? withNavBar) {
  PersistentNavBarNavigator.pushNewScreen(
    context,
    screen: screen,
    withNavBar: withNavBar ?? true,
    pageTransitionAnimation: PageTransitionAnimation.cupertino,
  );
}
