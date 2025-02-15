import 'package:flutter/material.dart';
import 'package:immunity_networks/domain/repository/api_repository.dart';

abstract class BaseStatefulWidget extends StatefulWidget {
  const BaseStatefulWidget({super.key});

  @override
  BaseStatefulWidgetState createState();
}

abstract class BaseStatefulWidgetState<T extends BaseStatefulWidget>
    extends State<T> {
  final apiRepo = ApiRepository();
  FocusScopeNode? currentFocus;
  var isLoading = false;

  hideKeyboard() {
    currentFocus = FocusScope.of(context);
    if (!currentFocus!.hasPrimaryFocus) {
      currentFocus!.unfocus();
    }
  }

  showLoadingIndicator() {
    setState(() {
      isLoading = true;
    });
  }

  hideLoadingIndicator() {
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
