import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:waspha/src/features/login/domain/login_domain.dart';

import '../../../widgets/auth_btn/auth_btn.dart';
import '../../../widgets/auth_container/auth_container.dart';
import '../../../widgets/custom_field/custom_field.dart';
import '../../../widgets/social_media/social_media.dart';
import '../domain/social_service.dart';

class LoginScreen extends HookConsumerWidget {
  LoginScreen({super.key});
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isRememberBoxChecked = useState(false);

    Future validateForm() async {
      if (_formKey.currentState!.validate()) {
        ref.watch(sendLogProvider(
            mobile: mobileController.text,
            password: passwordController.text,
            keepLogin: isRememberBoxChecked.value,
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
            SocialMedia(
              googleOnTap: () =>
                  ref.watch(googleServiceProvider).signIn(context),
              facebookOnTap: () {},
              appleOnTap: () => ref.watch(appleServiceProvider).signIn(),
            ),
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
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Checkbox(
                      value: isRememberBoxChecked.value,
                      onChanged: (value) {
                        isRememberBoxChecked.value = value!;
                      }),
                  Text("Remember me"),
                  Spacer(),
                  GestureDetector(
                      onTap: () => context.push("/forget_password"),
                      child: Text("Forgot Password?")),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            WasphaButton(
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
