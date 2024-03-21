import 'package:flutter/material.dart';
import 'package:immunity_networks/app/constants.dart';
import 'package:immunity_networks/presentation/resources/color_manager.dart';
import 'package:immunity_networks/presentation/utills/extentions.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

typedef StringValue = String? Function(String);

class CustomOtpField extends StatefulWidget {
  final OtpFieldController otpController;
  final StringValue onOtpComplete;

  const CustomOtpField({
    Key? key,
    required this.otpController,
    required this.onOtpComplete,
  }) : super(key: key);

  @override
  State<CustomOtpField> createState() => _CustomOtpFieldState();
}

class _CustomOtpFieldState extends State<CustomOtpField> {
  @override
  Widget build(BuildContext context) {
    return OTPTextField(
        controller: widget.otpController,
        length: Constants.optFieldLength,
        width: MediaQuery.of(context).size.width,
        textFieldAlignment: MainAxisAlignment.spaceAround,
        otpFieldStyle: OtpFieldStyle(
            borderColor: ColorManager.inputFieldTextColor,
            focusBorderColor: ColorManager.textColor,
            disabledBorderColor: ColorManager.inputFieldTextColor),
        fieldWidth: 50,
        fieldStyle: FieldStyle.underline,
        outlineBorderRadius: 12,
        style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: ColorManager.inputFieldTextColor),
        onChanged: (pin) {
          widget.onOtpComplete(pin);
        },
        onCompleted: (pin) {
          "OTP Enter ::: $pin".printMessage();
        });
  }
}
