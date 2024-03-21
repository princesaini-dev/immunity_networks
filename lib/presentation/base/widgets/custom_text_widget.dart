import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {
  final String text;
  final double fontSize;
  final TextAlign textAlign;
  final Color color;
  final FontWeight fontWeight;
  const CustomTextWidget({
    Key? key,
    required this.text,
    required this.fontSize,
    this.textAlign = TextAlign.start,
    required this.color,
    required this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
      ),
    );
    ;
  }
}
