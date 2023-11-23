import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../widgets/auth_btn/auth_btn.dart';
import '../../custom_need/presentation/custom_need.dart';
import '../domain/forget_domain.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: CustomBackButton(),
        ),
      ),
      body: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "Forget Password",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Email",
                        suffixIcon: Icon(Icons.delete)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                      "Enter your email address and we will send you a otp to reset your password"),
                  SizedBox(
                    height: 40,
                  ),
                  Consumer(
                    builder: (context, ref, child) => WasphaButton(
                      onTap: () {
                        ref.read(forgetPasswordProvider(
                            user_id: emailController.text, context: context));
                      },
                      text: "Continue",
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
