import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    super.key,
    required this.onTap,
    required this.text,
  });
  final Function() onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
          width: double.infinity,
          height: 50,
          child: GestureDetector(
            onTap: onTap,
            child: Container(
              width: 110,
              height: 50,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      colors: [
                        Color(0xFF002286),
                        Color.fromARGB(255, 161, 75, 95),
                      ]),
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                  child: Text(
                text.toUpperCase(),
                style: TextStyle(color: Colors.white, fontSize: 18),
              )),
            ),
          )),
    );
  }
}
