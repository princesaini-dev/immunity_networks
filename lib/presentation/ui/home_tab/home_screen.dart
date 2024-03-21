import 'package:flutter/material.dart';
import 'package:immunity_networks/presentation/base/base_stateful_widget.dart';

class HomeScreen extends BaseStatefulWidget {
  const HomeScreen({super.key});

  @override
  BaseStatefulWidgetState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends BaseStatefulWidgetState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Container()),
    );
  }
}
