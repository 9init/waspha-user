import 'dart:io';

import 'package:flutter/material.dart';

class SocialMedia extends StatelessWidget {
  const SocialMedia({
    super.key,
    required this.googleOnTap,
    required this.facebookOnTap,
    required this.appleOnTap,
  });
  final Function() googleOnTap, facebookOnTap, appleOnTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // GestureDetector(
        //   onTap: facebookOnTap,
        //   child: Container(
        //     width: 90,
        //     height: 40,
        //     color: Color(0xFF3B5999),
        //     child: Icon(Icons.facebook, color: Colors.white),
        //   ),
        // ),
        // SizedBox(
        //   width: 10,
        // ),
        GestureDetector(
          onTap: googleOnTap,
          child: Container(
            width: 90,
            height: 40,
            color: Color(0xFFFDD4B39),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                "assets/images/onboarding/google.png",
                color: Colors.white,
              ),
            ),
          ),
        ),
        if (Platform.isIOS) ...{
          SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: appleOnTap,
            child: Container(
              width: 90,
              color: Colors.black,
              height: 40,
              child: Icon(Icons.apple, color: Colors.white),
            ),
          ),
        }
      ],
    );
  }
}
