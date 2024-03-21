import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:immunity_networks/presentation/base/base_stateful_widget.dart';
import 'package:immunity_networks/presentation/resources/color_manager.dart';
import 'package:immunity_networks/presentation/resources/string_manager.dart';
import 'package:immunity_networks/presentation/ui/google_map_tab/google_map_screen.dart';
import 'package:immunity_networks/presentation/ui/home_tab/home_screen.dart';
import 'package:immunity_networks/presentation/ui/petals_tab/petals_screen.dart';
import 'package:immunity_networks/presentation/ui/profile_tab/profile_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class DashBoardScreen extends BaseStatefulWidget {
  const DashBoardScreen({super.key});

  @override
  BaseStatefulWidgetState createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends BaseStatefulWidgetState {
  late PersistentTabController _persistentTabController;

  @override
  void initState() {
    super.initState();
    _persistentTabController = PersistentTabController(initialIndex: 2);
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: ColorManager.whiteDark,
        body: SafeArea(
          child: PersistentTabView(
            context,
            controller: _persistentTabController,
            screens: _buildScreens(),
            items: _navBarsItems(),
            confineInSafeArea: true,
            backgroundColor: ColorManager.white,
            handleAndroidBackButtonPress: true,
            resizeToAvoidBottomInset: true,
            stateManagement: true,
            hideNavigationBarWhenKeyboardShows: true,
            decoration: NavBarDecoration(
              borderRadius: BorderRadius.circular(10.0),
              colorBehindNavBar: Colors.white,
            ),
            popAllScreensOnTapOfSelectedTab: true,
            popActionScreens: PopActionScreensType.all,
            itemAnimationProperties: const ItemAnimationProperties(
              duration: Duration(milliseconds: 200),
              curve: Curves.ease,
            ),
            screenTransitionAnimation: const ScreenTransitionAnimation(
              animateTabTransition: true,
              curve: Curves.ease,
              duration: Duration(milliseconds: 200),
            ),
            navBarStyle: NavBarStyle.style13,
          ),
        ),
      ),
    );
  }

  List<Widget> _buildScreens() {
    return [
      const ProfileScreen(),
      const PetalsScreen(),
      const HomeScreen(),
      const GoogleMapScreen()
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.person),
        title: (StringManager.profile),
        activeColorPrimary: ColorManager.appThemeColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.collections),
        title: (StringManager.petals),
        activeColorPrimary: ColorManager.appThemeColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.home),
        title: (StringManager.home),
        activeColorPrimary: ColorManager.appThemeColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.search),
        title: (StringManager.search),
        activeColorPrimary: ColorManager.appThemeColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }
}
