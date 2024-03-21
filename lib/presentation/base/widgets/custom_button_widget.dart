// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:immunity_networks/presentation/resources/color_manager.dart';
import 'package:immunity_networks/presentation/resources/font_manager.dart';
import 'package:immunity_networks/presentation/utills/extentions.dart';

class CustomButtonWidget extends StatelessWidget {
  final String title;
  final double fontSize;
  final double height;
  final Color backgroundColor;
  final Color textColor;
  final double radius;
  final bool isLoadingIndicator;
  final ClickListener onClickListener;

  const CustomButtonWidget({
    Key? key,
    required this.title,
    this.fontSize = FontSize.s18,
    this.height = 50,
    this.backgroundColor = ColorManager.appThemeColor,
    this.textColor = ColorManager.white,
    this.radius = 22,
    this.isLoadingIndicator = false,
    required this.onClickListener,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ElevatedButton(
          onPressed: onClickListener,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(backgroundColor),
            shadowColor:
                MaterialStateProperty.all<Color>(ColorManager.appThemeColor),
            elevation: MaterialStateProperty.all<double>(4),
            shape: MaterialStateProperty.all<OutlinedBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(radius)),
              ),
            ),
          ),
          child: SizedBox(
            width: double.infinity,
            height: height,
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.w500,
                  color: textColor,
                ),
              ),
            ),
          ),
        ),
        Visibility(
          visible: isLoadingIndicator,
          child: const Positioned(
            left: 25,
            top: 5,
            bottom: 5,
            child: Center(
              child: SizedBox(
                width: 30,
                height: 30,
                child: CircularProgressIndicator(
                  color: ColorManager.white,
                  strokeWidth: 2,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
