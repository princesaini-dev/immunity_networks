import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:immunity_networks/data/model/signup_data_model.dart';
import 'package:immunity_networks/presentation/base/base_stateful_widget.dart';
import 'package:immunity_networks/presentation/base/common/navigation.dart';
import 'package:immunity_networks/presentation/base/widgets/app_branding.dart';
import 'package:immunity_networks/presentation/base/widgets/custom_button_widget.dart';
import 'package:immunity_networks/presentation/base/widgets/custom_otp_field.dart';
import 'package:immunity_networks/presentation/base/widgets/custom_text_widget.dart';
import 'package:immunity_networks/presentation/resources/assets_manager.dart';
import 'package:immunity_networks/presentation/resources/color_manager.dart';
import 'package:immunity_networks/presentation/resources/font_manager.dart';
import 'package:immunity_networks/presentation/resources/routes_manager.dart';
import 'package:immunity_networks/presentation/resources/string_manager.dart';
import 'package:immunity_networks/presentation/ui/authentication/verifyOtp/bloc/verify_otp_bloc.dart';
import 'package:immunity_networks/presentation/ui/authentication/verifyOtp/bloc/verify_otp_event.dart';
import 'package:immunity_networks/presentation/ui/authentication/verifyOtp/bloc/verify_otp_state.dart';
import 'package:otp_text_field/otp_text_field.dart';

class VerifyOtpScreen extends BaseStatefulWidget {
  final SignUpDataResponse signUpDataResponse;
  const VerifyOtpScreen({super.key, required this.signUpDataResponse});

  @override
  BaseStatefulWidgetState createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends BaseStatefulWidgetState<VerifyOtpScreen> {
  final OtpFieldController controllerOtpField = OtpFieldController();
  String otpCode = "";

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
          child: BlocConsumer<VerifyOtpBloc, VerifyOtpState>(
            listener: (context, state) {
              hideLoadingIndicator();
              if (state is VerifyOtpStatusSuccess) {
                if (state.authDataModel.profileComplete == true) {
                  // dashboard
                } else {
                  pushNavigation(Routes.completeProfile,
                      arguments: state.authDataModel.user?.phone ?? '');
                }
              } else if (state is VerifyOtpStatusLoading) {
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
                        text: StringManager.codeConfirmation,
                        fontSize: FontSize.s20,
                        textAlign: TextAlign.start,
                        color: ColorManager.textColor,
                        fontWeight: FontWeightManager.bold),
                    const SizedBox(
                      height: 65,
                    ),
                    CustomOtpField(
                      otpController: controllerOtpField,
                      onOtpComplete: (otp) {
                        otpCode = otp;
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    CustomButtonWidget(
                      title: StringManager.confirmCode,
                      isLoadingIndicator: isLoading,
                      onClickListener: () {
                        _onComfirmButtonClicked(widget.signUpDataResponse);
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

  _onComfirmButtonClicked(SignUpDataResponse signUpDataResponse) {
    hideKeyboard();
    final loginBloc = BlocProvider.of<VerifyOtpBloc>(context);
    loginBloc.add(VerifyOtpObject(
        otpCode: otpCode,
        urlCode: signUpDataResponse.urlCode!,
        phoneNumber: signUpDataResponse.phone!));
  }
}
