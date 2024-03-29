import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:waspha/src/features/login/domain/login_domain.dart';
import 'package:waspha/src/features/register/domain/register_domain.dart';
import 'package:waspha/src/widgets/auth_btn/auth_btn.dart';
import 'package:waspha/src/widgets/auth_container/auth_container.dart';
import 'package:waspha/src/widgets/custom_field/custom_field.dart';
import 'package:waspha/src/widgets/social_media/social_media.dart';
import 'package:phone_form_field/phone_form_field.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RegisterScreen();
}

class _RegisterScreen extends ConsumerState<RegisterScreen> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController referralController = TextEditingController();
  final PhoneController mobileController = PhoneController(null);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    validateForm() {
      if (_formKey.currentState!.validate()) {
        ref.watch(sendRegisterProvider(
            userName: fullNameController.text,
            email: emailController.text,
            countryCode: "+${mobileController.value?.countryCode}",
            phoneNumber: mobileController.value?.nsn ?? "",
            password: passwordController.text,
            fullNumber: mobileController.value?.international ?? "",
            context: context));
      }
    }

    return Scaffold(
        body: SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            AuthContainer(
              title: "Sign up now",
              text: "Please fill the details",
              titleSize: 30,
            ),
            Text("signup  via social networks"),
            SizedBox(
              height: 10,
            ),
            SocialMedia(
              googleOnTap: () =>
                  ref.read(singInWithGoogleProvider(context: context)),
              facebookOnTap: () {},
              appleOnTap: () =>
                  ref.watch(singInWithAppleProvider(context: context)),
            ),
            SizedBox(
              height: 10,
            ),
            Text("or Create a new account"),
            SizedBox(
              height: 10,
            ),
            CustomFormField(controller: fullNameController, text: "Full Name"),
            SizedBox(
              height: 10,
            ),
            CustomFormField(controller: emailController, text: "Email"),
            SizedBox(
              height: 10,
            ),
            CustomFormField(
              controller: passwordController,
              text: "Password",
              isPassword: true,
            ),
            SizedBox(
              height: 10,
            ),
            CustomFormField(
              controller: confirmPasswordController,
              text: "Re-enter Password",
              isPassword: true,
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: PhoneFormField(
                controller: mobileController,
                decoration: InputDecoration(
                  labelText: 'Mobile Number',
                  border: UnderlineInputBorder(),
                ),
                showFlagInInput: true,
                defaultCountry: IsoCode.EG,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            CustomFormField(
                controller: referralController,
                isOptional: true,
                text: "Referral Code (Optional)"),
            SizedBox(
              height: 10,
            ),
            WasphaButton(
              onTap: () => validateForm(),
              text: "Sign up",
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account?"),
                TextButton(
                    onPressed: () => context.go('/login'),
                    child: Text(
                      "Login",
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
