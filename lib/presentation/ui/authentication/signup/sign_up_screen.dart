import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:immunity_networks/presentation/base/base_stateful_widget.dart';
import 'package:immunity_networks/presentation/base/common/navigation.dart';
import 'package:immunity_networks/presentation/base/widgets/app_branding.dart';
import 'package:immunity_networks/presentation/base/widgets/custom_button_widget.dart';
import 'package:immunity_networks/presentation/base/widgets/custom_country_code_picker.dart';
import 'package:immunity_networks/presentation/base/widgets/custom_text_widget.dart';
import 'package:immunity_networks/presentation/resources/assets_manager.dart';
import 'package:immunity_networks/presentation/resources/color_manager.dart';
import 'package:immunity_networks/presentation/resources/font_manager.dart';
import 'package:immunity_networks/presentation/resources/routes_manager.dart';
import 'package:immunity_networks/presentation/resources/string_manager.dart';
import 'package:immunity_networks/presentation/ui/authentication/signup/bloc/signup_bloc.dart';
import 'package:immunity_networks/presentation/ui/authentication/signup/bloc/signup_event.dart';
import 'package:immunity_networks/presentation/ui/authentication/signup/bloc/signup_state.dart';

class SignUpScreen extends BaseStatefulWidget {
  const SignUpScreen({super.key});

  @override
  BaseStatefulWidgetState createState() => _LoginScreenState();
}

class _LoginScreenState extends BaseStatefulWidgetState {
  final TextEditingController controllerPhoneMumber = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AssetsManager.authBackgroundImage),
            fit: BoxFit.cover, // You can adjust the BoxFit as needed
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SafeArea(
          child: BlocConsumer<SignUpBloc, SignUpState>(
            listener: (context, state) {
              hideLoadingIndicator();
              if (state is SignUpStatusSuccess) {
                state.signUpDataResponse!.phone = controllerPhoneMumber.text;
                pushNavigation(Routes.verifyOtpRoute,
                    arguments: state.signUpDataResponse);
              } else if (state is SignUpStatusLoading) {
                showLoadingIndicator();
              }
            },
            builder: (context, state) {
              return SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 25,
                    ),
                    const AppBrandingLogo(
                      showBackButton: true,
                    ),
                    const SizedBox(
                      height: 45,
                    ),
                    const CustomTextWidget(
                        text: StringManager.signUpScreenTitle,
                        fontSize: FontSize.s20,
                        textAlign: TextAlign.start,
                        color: ColorManager.textColor,
                        fontWeight: FontWeightManager.bold),
                    const SizedBox(
                      height: 65,
                    ),
                    CustomCountryCodePiker(
                        controller: controllerPhoneMumber,
                        hint: StringManager.phoneNumberHint,
                        isPasswordField: false),
                    const SizedBox(
                      height: 60,
                    ),
                    CustomButtonWidget(
                      title: StringManager.sendNow,
                      isLoadingIndicator: isLoading,
                      onClickListener: () {
                        _onSignUpButtonClicked();
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  _onSignUpButtonClicked() {
    hideKeyboard();
    final loginBloc = BlocProvider.of<SignUpBloc>(context);
    loginBloc.add(SignUpUser(phoneNumber: controllerPhoneMumber.text));
  }
}
