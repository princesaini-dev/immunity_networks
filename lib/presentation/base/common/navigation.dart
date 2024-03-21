import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

pushNavigation(String routeName, {Object? arguments}) {
  navigatorKey.currentState!.pushNamed(routeName, arguments: arguments);
}

pushNavigationWithReplacement(String routeName, {Object? arguments}) {
  navigatorKey.currentState!
      .pushReplacementNamed(routeName, arguments: arguments);
}

popNavigation() {
  if (navigatorKey.currentState!.canPop()) {
    navigatorKey.currentState!.pop();
  }
}
