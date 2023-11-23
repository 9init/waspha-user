import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:waspha/src/features/verification/domain/verify_domain.dart';
import 'package:waspha/src/widgets/auth_btn/auth_btn.dart';
import 'package:waspha/src/widgets/auth_container/auth_container.dart';

// ignore: must_be_immutable
class VerificationScreen extends HookConsumerWidget {
  dynamic fullNumber;

  VerificationScreen({super.key, required this.fullNumber});
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  OtpFieldController otpController = OtpFieldController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pinsState = useState('');

    validateForm() {
      if (_formKey.currentState!.validate()) {
        ref.watch(verifyOTPProvider(otp: pinsState.value, context: context));
      }
      print(pinsState);
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              AuthContainer(
                title: "Verification",
                titleSize: 30,
              ),
              SizedBox(
                height: 30,
              ),
              Text("Verification code "),
              SizedBox(
                height: 20,
              ),
              Text("OTP will be sent to your $fullNumber"),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 30),
                child: Align(
                    alignment: Alignment.centerRight,
                    child:
                        ElevatedButton(onPressed: () {}, child: Text("Edit"))),
              ),
              SizedBox(
                height: 20,
              ),
              OTPTextField(
                length: 4,
                controller: otpController,
                width: MediaQuery.of(context).size.width,
                fieldWidth: 80,
                style: TextStyle(fontSize: 17),
                textFieldAlignment: MainAxisAlignment.spaceAround,
                fieldStyle: FieldStyle.box,
                onCompleted: (pin) {
                  print("Completed: " + pin);
                  pinsState.value = pin;
                },
              ),
              SizedBox(
                height: 20,
              ),
              WasphaButton(onTap: () => validateForm(), text: "Verify"),
              SizedBox(
                height: 20,
              ),
              Text("Didn't receive the code?"),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  int userID = ref.watch(userIDProvider);
                  print("ID: $userID");
                  ref.watch(resendOTPProvider);
                },
                child: Text("Resend OTP"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
