import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:waspha/core/const/colors/colors.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
    this.backgroundColor = WasphaColors.black,
    this.foregroundColor = WasphaColors.white,
    this.isGoFromMainScreen = false,
  });

  final Color backgroundColor, foregroundColor;
  final bool? isGoFromMainScreen;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          shape: BoxShape.circle,
        ),
        width: 42,
        height: 42,
        child: IconButton(
          iconSize: 18,
          padding: EdgeInsets.zero,
          onPressed: isGoFromMainScreen == true
              ? () => context.go('/')
              : () => context.pop(),
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: foregroundColor,
          ),
        ),
      ),
    );
  }
}
