import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:immunity_networks/presentation/base/common/navigation.dart';
import 'package:immunity_networks/presentation/resources/routes_manager.dart';
import 'package:immunity_networks/presentation/ui/authentication/completeProfile/bloc/complete_profile_bloc.dart';
import 'package:immunity_networks/presentation/ui/authentication/login/bloc/login_bloc.dart';
import 'package:immunity_networks/presentation/ui/authentication/signup/bloc/signup_bloc.dart';
import 'package:immunity_networks/presentation/ui/authentication/verifyOtp/bloc/verify_otp_bloc.dart';
import 'package:immunity_networks/presentation/ui/edit_profile_screen/bloc/edit_profile_screen_bloc.dart';
import 'package:immunity_networks/presentation/ui/profile_tab/bloc/profile_screen_bloc.dart';

class MyApp extends StatefulWidget {
  MyApp._internal(); // private named constructor
  int appState = 0;
  static final MyApp instance =
      MyApp._internal(); // single instance -- singleton

  factory MyApp() => instance; // factory for the class instance

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
//  AppPreferences _appPreferences = instance<AppPreferences>();

  @override
  void didChangeDependencies() {
    //  _appPreferences.getLocal().then((local) => {context.setLocale(local)});

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: _getBlocProviderlist(),
      child: MaterialApp(
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouteGenerator.getRoute,
        initialRoute: Routes.splashRoute,
      ),
    );
  }

  _getBlocProviderlist() {
    return [
      BlocProvider(
        create: (context) => LoginBloc(),
      ),
      BlocProvider(
        create: (context) => SignUpBloc(),
      ),
      BlocProvider(
        create: (context) => VerifyOtpBloc(),
      ),
      BlocProvider(
        create: (context) => CompleteProfileBloc(),
      ),
      BlocProvider(
        create: (context) => ProfileScreenBloc(),
      ),
       BlocProvider(
        create: (context) => EditProfileScreenBloc(),
      )
    ];
  }
}
