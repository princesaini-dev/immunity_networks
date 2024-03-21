import 'package:flutter/material.dart';
import 'package:immunity_networks/presentation/resources/color_manager.dart';
import 'package:lottie/lottie.dart';

class CustomLoadingOverlay extends StatelessWidget {
  final bool isLoading;
  final Widget child;

  const CustomLoadingOverlay(
      {Key? key, required this.isLoading, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Expanded(child: child),
          ],
        ),
        if (isLoading)
          Center(
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: ColorManager.whiteDark),
              child: Center(
                child: SizedBox(
                  child: Lottie.asset(
                    'assets/json/loading_indicator2.json',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          )
      ],
    );
  }
}
