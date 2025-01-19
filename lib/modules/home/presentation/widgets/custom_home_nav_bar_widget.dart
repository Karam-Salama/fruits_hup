import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../cart/presentation/views/cart_view.dart';
import '../../../category/presentation/views/products_view.dart';
import '../../../setting/presentation/views/setting_view.dart';
import '../views/best_celling_view.dart';
import '../views/notification_view.dart';
import '../views/search_view.dart';
import '../views/home_view.dart';

class HomeNavBarWidget extends StatelessWidget {
  final PersistentTabController _controller = PersistentTabController();

  HomeNavBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      screens: _buildScreens(),
      items: _navBarsItems(),
      controller: _controller,
      navBarStyle: NavBarStyle.style12,
      animationSettings: const NavBarAnimationSettings(
        navBarItemAnimation: ItemAnimationSettings(
          duration: Duration(milliseconds: 400),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimationSettings(
          animateTabTransition: true,
          duration: Duration(milliseconds: 200),
          screenTransitionAnimationType: ScreenTransitionAnimationType.fadeIn,
        ),
      ),
      decoration: NavBarDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0x19000000),
            spreadRadius: 0,
            blurRadius: 25,
            offset: const Offset(0, -2),
          ),
        ],
        colorBehindNavBar: AppColors.transparent,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
    );
  }

  List<Widget> _buildScreens() {
    return [
      HomeView(),
      const ProductsView(),
      const CartView(),
      const SettingView(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(Assets.assetsIconsHomeActiveIcon),
        inactiveIcon: SvgPicture.asset(Assets.assetsIconsHome),
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          initialRoute: "/",
          routes: {
            BestCellingView.routeName: (final context) =>
                const BestCellingView(),
            SearchView.routeName: (final context) => const SearchView(),
            NotificationView.routeName: (final context) =>
                const NotificationView(),
          },
        ),
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(Assets.assetsIconsCategoryActiveIcon),
        inactiveIcon: SvgPicture.asset(Assets.assetsIconsCategory),
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(Assets.assetsIconsCartActiveIcon),
        inactiveIcon: SvgPicture.asset(Assets.assetsIconsCart),
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(Assets.assetsIconsPersonActiveIcon),
        inactiveIcon: SvgPicture.asset(Assets.assetsIconsPerson),
      ),
    ];
  }
}
