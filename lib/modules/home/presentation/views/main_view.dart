import 'package:flutter/material.dart';
import '../widgets/custom_home_nav_bar_widget.dart';
import 'home_view.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});
  static const String routeName = '/home-View';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeView(),
      bottomNavigationBar: HomeNavBarWidget(),
    );
  }
}
