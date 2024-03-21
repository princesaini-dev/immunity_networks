import 'package:flutter/material.dart';
import 'package:immunity_networks/data/model/signup_data_model.dart';
import 'package:immunity_networks/data/model/user_profile_data_model.dart';
import 'package:immunity_networks/presentation/ui/authentication/completeProfile/complete_profile_screen.dart';
import 'package:immunity_networks/presentation/ui/authentication/login/login_screen.dart';
import 'package:immunity_networks/presentation/ui/authentication/signup/sign_up_screen.dart';
import 'package:immunity_networks/presentation/ui/authentication/verifyOtp/verify_otp_screen.dart';
import 'package:immunity_networks/presentation/ui/dashboard/dashboard_screen.dart';
import 'package:immunity_networks/presentation/ui/edit_profile_screen/edit_profile_screen.dart';
import 'package:immunity_networks/presentation/ui/splash/splash_screen.dart';

class Routes {
  static const String splashRoute = "/ui/splash";
  static const String loginRoute = "/ui/login";
  static const String signUpRoute = "/ui/signUp";
  static const String verifyOtpRoute = "/ui/verifyOtp";
  static const String completeProfile = "/ui/completeProfile";
  static const String dashBoardRoute = "/ui/dashboard";
  static const String editProfileRoute = "/ui/editProfileScreen";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      case Routes.signUpRoute:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());

      case Routes.verifyOtpRoute:
        var arguments = routeSettings.arguments as SignUpDataResponse;
        return MaterialPageRoute(
            builder: (_) => VerifyOtpScreen(
                  signUpDataResponse: arguments,
                ));

      case Routes.completeProfile:
        var phoneNumber = routeSettings.arguments as String;
        return MaterialPageRoute(
            builder: (_) => CompleteProfileScreen(phoneNumber: phoneNumber));

      case Routes.dashBoardRoute:
        return MaterialPageRoute(builder: (_) => const DashBoardScreen());

      case Routes.editProfileRoute:
        var arguments = routeSettings.arguments as UserProfileDataModel;
        return MaterialPageRoute(
            builder: (_) => EditProfileScreen(
                  userProfileDataModel: arguments,
                ));

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text(''),
              ),
              body: const Center(child: Text('')),
            ));
  }
}
