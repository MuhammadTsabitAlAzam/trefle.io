import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:project_akhir_mobile/Screen/ConverterScreen.dart';
import 'package:project_akhir_mobile/Screen/KesanPesanScreen.dart';
import 'package:project_akhir_mobile/Screen/ProfileScreen.dart';
import '../Screen/HomeScreen.dart';

class BottomNavbar extends StatelessWidget {
  final int? index;
  BottomNavbar({Key? key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: PersistentTabController(initialIndex: index ?? 0),
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style1,
    );
  }

  List<Widget> _buildScreens() {
    return [
      HomeScreen(),
      ConverterScreen(),
      KesanPesanScreen(),
      ProfileScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home),
        title: 'Home',
        activeColorPrimary: Colors.grey.shade700,
        inactiveColorPrimary: Colors.grey.shade700,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.access_time_filled),
        title: 'Converter',
        activeColorPrimary: Colors.grey.shade700,
        inactiveColorPrimary: Colors.grey.shade700,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.mail),
        title: 'Kesan Pesan',
        activeColorPrimary: Colors.grey.shade700,
        inactiveColorPrimary: Colors.grey.shade700,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.person),
        title: 'Profile',
        activeColorPrimary: Colors.grey.shade700,
        inactiveColorPrimary: Colors.grey.shade700,
      ),
    ];
  }
}
