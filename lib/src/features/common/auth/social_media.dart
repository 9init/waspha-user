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
        GestureDetector(
          onTap: facebookOnTap,
          child: Container(
            width: 90,
            height: 40,
            color: const Color(0xFF3B5999),
            child: const Icon(Icons.facebook, color: Colors.white),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        GestureDetector(
          onTap: googleOnTap,
          child: Container(
            width: 90,
            height: 40,
            color: const Color(0xFFDD4B39),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                "assets/imgs/onboarding/google.png",
                color: Colors.white,
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        GestureDetector(
          onTap: appleOnTap,
          child: Container(
            width: 90,
            color: Colors.black,
            height: 40,
            child: const Icon(Icons.apple, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
