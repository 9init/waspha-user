import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:waspha/src/features/login/domain/login_domain.dart';

import '../../../widgets/auth_btn/auth_btn.dart';
import '../../../widgets/auth_container/auth_container.dart';
import '../../../widgets/custom_field/custom_field.dart';
import '../../../widgets/social_media/social_media.dart';

class LoginScreen extends ConsumerWidget {
  LoginScreen({super.key});
  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future validateForm() async {
      if (_formKey.currentState!.validate()) {
        ref.watch(sendLogProvider(
            mobile: mobileController.text,
            password: passwordController.text,
            context: context));
      }
    }

    return Scaffold(
        body: SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            AuthContainer(text: "Welcome, Please login to \n your account."),
            SizedBox(
              height: 50,
            ),
            Text("Login  via social networks"),
            SizedBox(
              height: 10,
            ),
            SocialMedia(),
            SizedBox(
              height: 10,
            ),
            Text("or login with mobile"),
            SizedBox(
              height: 10,
            ),
            CustomFormField(
                controller: mobileController, text: "Mobile Number"),
            SizedBox(
              height: 30,
            ),
            CustomFormField(
                controller: passwordController,
                text: "Password",
                isPassword: true),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("Forgot Password?"),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            AuthButton(
              onTap: validateForm,
              text: "Continue",
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account?"),
                TextButton(
                    onPressed: () => context.go("/register"),
                    child: Text(
                      "Sign Up",
                      style: TextStyle(color: Colors.blue),
                    ))
              ],
            )
          ],
        ),
      ),
    ));
  }
}
