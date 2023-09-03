import 'package:flutter/material.dart';

import '../../features/login/presentation/custom_clip.dart';

class AuthContainer extends StatelessWidget {
  const AuthContainer({
    super.key,
    this.text,
    this.height = 250,
    this.title = "We are \n WASPHA",
    this.titleSize = 40,
  });

  final String? text;
  final String title;
  final double height;
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
            height: height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [
                    Color(0xFF002286),
                    Color.fromARGB(255, 161, 75, 95),
                  ]),
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
                    SizedBox(
                      height: 10,
                    ),
                    text != null
                        ? Text(text!,
                            style: TextStyle(color: Colors.white, fontSize: 15))
                        : Container(),
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
            opacity: AlwaysStoppedAnimation(0.2),
          ),
        ),
      ],
    );
  }
}
