import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 40),
            Text(
              'You need to login to access this page',
              style: TextStyle(fontSize: 60.sp, fontWeight: FontWeight.bold),
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: SvgPicture.asset("assets/images/nearby/login.svg",
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width),
            ),
          ],
        ),
      ),
    );
  }
}
