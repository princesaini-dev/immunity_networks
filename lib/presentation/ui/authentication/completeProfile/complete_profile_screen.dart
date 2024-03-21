import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:immunity_networks/presentation/base/base_stateful_widget.dart';
import 'package:immunity_networks/presentation/base/common/navigation.dart';
import 'package:immunity_networks/presentation/base/widgets/app_branding.dart';
import 'package:immunity_networks/presentation/base/widgets/custom_button_widget.dart';
import 'package:immunity_networks/presentation/base/widgets/custom_edit_text_widget.dart';
import 'package:immunity_networks/presentation/base/widgets/custom_text_widget.dart';
import 'package:immunity_networks/presentation/resources/assets_manager.dart';
import 'package:immunity_networks/presentation/resources/color_manager.dart';
import 'package:immunity_networks/presentation/resources/font_manager.dart';
import 'package:immunity_networks/presentation/resources/routes_manager.dart';
import 'package:immunity_networks/presentation/resources/string_manager.dart';
import 'package:immunity_networks/presentation/ui/authentication/completeProfile/bloc/complete_profile_bloc.dart';
import 'package:immunity_networks/presentation/ui/authentication/completeProfile/bloc/complete_profile_event.dart';
import 'package:immunity_networks/presentation/ui/authentication/completeProfile/bloc/complete_profile_state.dart';

class CompleteProfileScreen extends BaseStatefulWidget {
  final String phoneNumber;

  const CompleteProfileScreen({super.key, required this.phoneNumber});

  @override
  BaseStatefulWidgetState createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState
    extends BaseStatefulWidgetState<CompleteProfileScreen> {
  final TextEditingController controllerFirstName = TextEditingController();
  final TextEditingController controllerLastName = TextEditingController();
  final TextEditingController controllerEmail = TextEditingController();
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
          child: BlocConsumer<CompleteProfileBloc, CompleteProfileState>(
            listener: (context, state) {
              hideLoadingIndicator();
              if (state is CompleteProfileStatusSuccess) {
                pushNavigation(Routes.loginRoute);
              } else if (state is CompleteProfileStatusLoading) {
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
                        text: StringManager.completeProfile,
                        fontSize: FontSize.s20,
                        textAlign: TextAlign.start,
                        color: ColorManager.textColor,
                        fontWeight: FontWeightManager.bold),
                    const SizedBox(
                      height: 55,
                    ),
                    CustomEditTextWidget(
                      controller: controllerFirstName,
                      hint: StringManager.firstName,
                      isPasswordField: false,
                      leadingIcon: AssetsManager.userLogoImage,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomEditTextWidget(
                      controller: controllerLastName,
                      hint: StringManager.lastName,
                      isPasswordField: false,
                      leadingIcon: AssetsManager.userLogoImage,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomEditTextWidget(
                      controller: controllerEmail,
                      hint: StringManager.email,
                      isPasswordField: false,
                      leadingIcon: AssetsManager.emailLogoImage,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomEditTextWidget(
                      controller: controllerPassword,
                      hint: StringManager.passwordHint,
                      isPasswordField: true,
                      leadingIcon: AssetsManager.passwordLogoImage,
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    CustomButtonWidget(
                      title: StringManager.sendNow,
                      isLoadingIndicator: isLoading,
                      onClickListener: () {
                        _onCompleteProfileClicked();
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

  _onCompleteProfileClicked() {
    hideKeyboard();
    final loginBloc = BlocProvider.of<CompleteProfileBloc>(context);
    loginBloc.add(CompleteProfileUser(
        firstName: controllerFirstName.text,
        lastName: controllerLastName.text,
        email: controllerEmail.text,
        phoneNumber: widget.phoneNumber,
        password: controllerPassword.text));
  }
}
