import 'package:flutter/material.dart';
import 'package:immunity_networks/presentation/base/widgets/custom_text_widget.dart';
import 'package:immunity_networks/presentation/resources/color_manager.dart';
import 'package:immunity_networks/presentation/resources/font_manager.dart';
import 'package:immunity_networks/presentation/resources/string_manager.dart';
import 'package:immunity_networks/presentation/utills/extentions.dart';

class CustomCheckboxWidget extends StatefulWidget {
  const CustomCheckboxWidget({super.key});

  @override
  State<CustomCheckboxWidget> createState() => _CustomCheckboxWidgetState();
}

class _CustomCheckboxWidgetState extends State<CustomCheckboxWidget> {
  bool isCheckboxEnable = false;

  _actionCheckboxClick(bool value) {
    setState(() {
      isCheckboxEnable = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Transform.scale(
          scale: 1.1,
          child: Checkbox(
            value: isCheckboxEnable,
            onChanged: (newValue) {
              _actionCheckboxClick(newValue!);
            },
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5))),
            checkColor: ColorManager.white,
            activeColor: ColorManager.appThemeColor,
          ),
        ),
        const CustomTextWidget(
                text: StringManager.rememberMe,
                fontSize: FontSize.s14,
                color: ColorManager.textColor,
                fontWeight: FontWeightManager.bold)
            .setOnClickListener(() {
          _actionCheckboxClick(!isCheckboxEnable);
        }),
      ],
    );
  }
}
