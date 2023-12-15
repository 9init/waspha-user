import 'package:flutter/material.dart';
import 'package:waspha/core/const/colors/colors.dart';

import '../../features/login/presentation/custom_clip.dart';

class AuthContainer extends StatelessWidget {
  const AuthContainer({
    super.key,
    this.text,
    this.title = "We are\nWASPHA",
    this.titleSize = 40,
  });

  final String? text;
  final String title;
  final double titleSize;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        ClipPath(
          clipper: CurveClipper(),
          child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [WasphaColors.tertiary, WasphaColors.secondary],
              ),
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(left: 70),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: titleSize,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    text != null
                        ? Text(
                            text!,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 15),
                          )
                        : Container(),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: -100,
          child: Image.asset(
            "assets/images/onboarding/atom.png",
            scale: 1.2,
            opacity: const AlwaysStoppedAnimation(0.2),
          ),
        ),
      ],
    );
  }
}
