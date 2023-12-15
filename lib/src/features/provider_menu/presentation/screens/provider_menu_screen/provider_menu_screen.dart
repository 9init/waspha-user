import 'package:flutter/material.dart';
import 'package:waspha/src/features/provider_menu/presentation/screens/provider_menu_screen/widgets/index.dart';

class ProviderMenuScreen extends StatelessWidget {
  const ProviderMenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ProviderMenuView(),
    );
  }
}
