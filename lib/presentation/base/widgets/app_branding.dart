import 'package:flutter/material.dart';
import 'package:immunity_networks/presentation/base/common/navigation.dart';
import 'package:immunity_networks/presentation/resources/assets_manager.dart';

class AppBrandingLogo extends StatelessWidget {
  final bool showBackButton;

  const AppBrandingLogo({Key? key, this.showBackButton = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AssetsManager.appLogo,
              height: 100,
            ),
          ],
        ),
        Visibility(
          visible: showBackButton,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                  height: 36,
                  width: 36,
                  child: IconButton(
                    icon: Image.asset(AssetsManager.backButtonImage),
                    onPressed: () {
                      popNavigation();
                    },
                  )),
            ],
          ),
        )
      ],
    );
  }
}
