

import 'package:flutter/material.dart';

class SocialMedia extends StatelessWidget {
  const SocialMedia({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 90,
          height: 40,
          color: Color(0xFF3B5999),
          child: Icon(Icons.facebook, color: Colors.white),
        ),
        SizedBox(
          width: 10,
        ),
        Container(
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
        SizedBox(
          width: 10,
        ),
        Container(
          width: 90,
          color: Colors.black,
          height: 40,
          child: Icon(Icons.apple, color: Colors.white),
        ),
      ],
    );
  }
}
