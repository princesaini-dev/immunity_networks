// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:immunity_networks/presentation/resources/color_manager.dart';
import 'package:immunity_networks/presentation/resources/font_manager.dart';

class CustomEditTextWidget extends StatefulWidget {
  TextEditingController controller;
  String hint;
  String leadingIcon;
  double fontSize;
  Color hintColor;
  bool isPasswordField;
  bool _obscureText = false;
  TextInputType inputType;
  List<TextInputFormatter>? inputFormatters;

  CustomEditTextWidget({
    Key? key,
    required this.controller,
    required this.hint,
    required this.leadingIcon,
    this.fontSize = FontSize.s16,
    this.hintColor = ColorManager.hint,
    this.isPasswordField = false,
    this.inputType = TextInputType.text,
    this.inputFormatters,
  }) : super(key: key);

  @override
  State<CustomEditTextWidget> createState() => _CustomEditTextWidgetState();
}

class _CustomEditTextWidgetState extends State<CustomEditTextWidget> {
  bool obscureText = false;

  void _togglePasswordVisibility() {
    setState(() {
      widget._obscureText = !widget._obscureText;
    });
  }

  @override
  void initState() {
    widget._obscureText = widget.isPasswordField;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorManager.inputFieldBackground,
        borderRadius: BorderRadius.circular(15),
      ),
      child: SizedBox(
        height: 55,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 18, right: 10),
              child: Image.asset(
                widget.leadingIcon,
                width: 22,
                height: 22,
              ),
            ),
            Expanded(
              child: TextField(
                controller: widget.controller,
                obscureText: widget._obscureText,
                cursorColor: ColorManager.appThemeColor,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    focusColor: ColorManager.hint,
                    hintText: widget.hint,
                    hintStyle: TextStyle(
                        fontSize: widget.fontSize, color: widget.hintColor),
                    suffixIcon: widget.isPasswordField
                        ? IconButton(
                            icon: Icon(
                              widget._obscureText
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onPressed: _togglePasswordVisibility,
                            color: ColorManager.hint,
                          )
                        : null),
                style: TextStyle(
                    fontSize: widget.fontSize,
                    fontWeight: FontWeight.w500,
                    color: ColorManager.inputFieldTextColor),
                keyboardType: widget.inputType,
                inputFormatters: widget.inputFormatters,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
