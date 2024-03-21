import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:immunity_networks/presentation/base/base_stateful_widget.dart';
import 'package:immunity_networks/presentation/base/common/navigation.dart';
import 'package:immunity_networks/presentation/base/widgets/app_branding.dart';
import 'package:immunity_networks/presentation/base/widgets/custom_button_widget.dart';
import 'package:immunity_networks/presentation/base/widgets/custom_checkbox_widget.dart';
import 'package:immunity_networks/presentation/base/widgets/custom_edit_text_widget.dart';
import 'package:immunity_networks/presentation/base/widgets/custom_text_widget.dart';
import 'package:immunity_networks/presentation/resources/assets_manager.dart';
import 'package:immunity_networks/presentation/resources/color_manager.dart';
import 'package:immunity_networks/presentation/resources/font_manager.dart';
import 'package:immunity_networks/presentation/resources/routes_manager.dart';
import 'package:immunity_networks/presentation/resources/string_manager.dart';
import 'package:immunity_networks/presentation/ui/authentication/login/bloc/login_bloc.dart';
import 'package:immunity_networks/presentation/ui/authentication/login/bloc/login_event.dart';
import 'package:immunity_networks/presentation/ui/authentication/login/bloc/login_state.dart';

class LoginScreen extends BaseStatefulWidget {
  const LoginScreen({super.key});

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
          child: BlocConsumer<LoginBloc, LoginState>(
            listener: (context, state) {
              hideLoadingIndicator();
              if (state is LoginStatusSuccess) {
                pushNavigationWithReplacement(Routes.dashBoardRoute);
              } else if (state is LoginStatusLoading) {
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
                    const AppBrandingLogo(),
                    const SizedBox(
                      height: 25,
                    ),
                    const CustomTextWidget(
                        text: StringManager.loginScreenTitle,
                        fontSize: FontSize.s20,
                        textAlign: TextAlign.center,
                        color: ColorManager.textColor,
                        fontWeight: FontWeightManager.bold),
                    const SizedBox(
                      height: 45,
                    ),
                    CustomEditTextWidget(
                      controller: controllerPhoneMumber,
                      hint: StringManager.phoneNumberHint,
                      leadingIcon: AssetsManager.userLogoImage,
                      inputType: TextInputType.phone,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    CustomEditTextWidget(
                        controller: controllerPassword,
                        hint: StringManager.passwordHint,
                        leadingIcon: AssetsManager.passwordLogoImage,
                        isPasswordField: true,
                        inputType: TextInputType.visiblePassword),
                    const SizedBox(
                      height: 10,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomCheckboxWidget(),
                        CustomTextWidget(
                            text: StringManager.forgotPassword,
                            fontSize: FontSize.s14,
                            color: ColorManager.textColor,
                            fontWeight: FontWeightManager.bold)
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    CustomButtonWidget(
                      title: StringManager.signInNow,
                      isLoadingIndicator: isLoading,
                      onClickListener: () {
                        _onLoginButtonClicked();
                      },
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    CustomButtonWidget(
                      title: StringManager.createAccount,
                      onClickListener: () {
                        pushNavigation(Routes.signUpRoute);
                      },
                      backgroundColor: ColorManager.lightBlue,
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

  _onLoginButtonClicked() {
    final loginBloc = BlocProvider.of<LoginBloc>(context);
    loginBloc.add(LoginUser(
        phoneNumber: controllerPhoneMumber.text,
        password: controllerPassword.text));
  }
}
