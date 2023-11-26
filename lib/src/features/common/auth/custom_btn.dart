import 'package:flutter/material.dart';

import '../colors/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onTap,
    required this.text,
    this.shape,
  });
  final String text;
  final Function() onTap;
  final MaterialStateProperty<OutlinedBorder?>? shape;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ButtonStyle(
          shape: shape,
          backgroundColor: const MaterialStatePropertyAll(WasphaColors.primary),
          foregroundColor: const MaterialStatePropertyAll(Colors.white)),
      child: Text(text),
    );
  }
}
