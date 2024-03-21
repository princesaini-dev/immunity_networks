import 'package:flutter/material.dart';
import 'package:immunity_networks/presentation/base/base_stateful_widget.dart';
import 'package:immunity_networks/presentation/base/common/navigation.dart';
import 'package:immunity_networks/presentation/resources/routes_manager.dart';

class SplashScreen extends BaseStatefulWidget {
  const SplashScreen({super.key});

  @override
  BaseStatefulWidgetState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends BaseStatefulWidgetState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _getAuthInfo();
  }

  _getAuthInfo() async {
    var userInfo = await apiRepo.getAuthenticationInfo();
    if (userInfo == null) {
      pushNavigationWithReplacement(Routes.loginRoute);
    } else {
      pushNavigationWithReplacement(Routes.dashBoardRoute);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
