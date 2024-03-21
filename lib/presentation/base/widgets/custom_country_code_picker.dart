import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:immunity_networks/presentation/resources/color_manager.dart';
import 'package:immunity_networks/presentation/utills/extentions.dart';

class CustomCountryCodePiker extends StatefulWidget {
  TextEditingController controller;
  String hint;
  double fontSize = 15;
  Color hintColor = ColorManager.hint;
  bool isPasswordField = false;
  TextInputType inputType = TextInputType.phone;

  CustomCountryCodePiker(
      {Key? key,
      required this.controller,
      required this.hint,
      this.fontSize = 15,
      this.hintColor = ColorManager.hint,
      this.isPasswordField = false,
      this.inputType = TextInputType.phone})
      : super(key: key);

  @override
  State<CustomCountryCodePiker> createState() => _CustomCountryCodePikerState();
}

class _CustomCountryCodePikerState extends State<CustomCountryCodePiker> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 60,
          decoration: BoxDecoration(
            color: ColorManager.inputFieldBackground,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: TextField(
              controller: widget.controller,
              obscureText: widget.isPasswordField,
              inputFormatters: [LengthLimitingTextInputFormatter(10)],
              cursorColor: ColorManager.appThemeColor,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  focusColor: ColorManager.hint,
                  hintText: widget.hint,
                  hintStyle: TextStyle(
                      fontSize: widget.fontSize, color: widget.hintColor),
                  contentPadding: const EdgeInsets.only(left: 50)),
              style: TextStyle(
                  fontSize: widget.fontSize,
                  fontWeight: FontWeight.w500,
                  color: ColorManager.black),
              keyboardType: widget.inputType,
            ),
          ),
        ),
        SizedBox(
          width: 50,
          height: 60,
          child: Align(
            alignment: Alignment.center,
            child: Center(
              child: CountryCodePicker(
                onChanged: (CountryCode code) {
                  code.toString().printMessage();
                },
                initialSelection: "IN",
                showFlagDialog: true,
                showFlag: false,
                showFlagMain: false,
                textStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: ColorManager.textColor,
                    fontSize: widget.fontSize),
                padding: const EdgeInsets.all(0),
                enabled: false,
              ),
            ),
          ),
        )
      ],
    );
  }
}
