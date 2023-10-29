import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:waspha/src/features/profile/presentation/profile.dart';

class NeedLoginScreen extends StatelessWidget {
  const NeedLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'You need to login to access this page',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                  onPressed: () => context.go('/register'),
                  text: "Register",
                  iconNeeded: false,
                ),
                SizedBox(width: 10),
                CustomButton(
                  onPressed: () => context.go('/login'),
                  text: "Login",
                  iconNeeded: false,
                ),
              ],
            ),
            SvgPicture.asset("assets/images/nearby/login.svg",
                width: 500, height: 500),
          ],
        ),
      ),
    );
  }
}
