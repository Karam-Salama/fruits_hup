import 'package:flutter/material.dart';
import '../widgets/coustom_home_nav_bar_widget.dart';
import '../widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const String routeName = '/home-View';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeViewBody(),
      bottomNavigationBar: HomeNavBarWidget(),
    );
  }
}
