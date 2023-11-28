import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phone_form_field/phone_form_field.dart';
import 'package:waspha/src/features/common/auth_btn/auth_btn.dart';
import 'package:waspha/src/features/common/custome_form/custom_form.dart';
import 'package:waspha/src/features/forget_password/viewmodel.dart';
import 'package:waspha/src/models/phone/phone_model.dart';

import '../common/auth/auth_container.dart';

class ForgetPassword extends ConsumerWidget {
  ForgetPassword({super.key});

  final TextEditingController _emailController = TextEditingController();
  final PhoneController _mobileController = PhoneController(null);
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            const WasphaHeader(
              title1: "Forgot your",
              title2: "Password?",
              title2Size: 30,
            ),
            const Spacer(),
            const Text(
              "Recover password using\nEmail or phone No.",
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            EmailField(
              emailController: _emailController,
            ),
            const SizedBox(height: 20),
            MobileField(
              mobileController: _mobileController,
            ),
            const SizedBox(height: 70),
            AuthButton(
              onTap: () {
                if (!_formKey.currentState!.validate()) return;

                final vmNotifier =
                    ref.read(passwordResetViewModelProvider.notifier);
                vmNotifier.requestResetPassword();

                final resetModel = ref.read(passwordResetViewModelProvider);
                context.push("/forget_pass_otp", extra: resetModel);
              },
              text: "Continue",
            ),
            const Spacer(),
            const Spacer(),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

class EmailField extends ConsumerWidget {
  const EmailField({
    super.key,
    required this.emailController,
  });

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vmProvider = passwordResetViewModelProvider;
    final viewmodel = ref.watch(vmProvider);
    final vmNotifier = ref.read(vmProvider.notifier);
    return Row(
      children: [
        Radio(
          value: 0,
          groupValue: viewmodel.selectedOption.value,
          onChanged: (value) {
            vmNotifier.updateSelectedOption(ResetOption.EMAIL);
          },
        ),
        Expanded(
          child: CustomFormField(
            controller: emailController,
            onChanged: (p0) =>
                vmNotifier.updateEmail(emailController.value.text),
            text: "Email Address",
            isOptional: viewmodel.selectedOption == ResetOption.PHONE,
          ),
        ),
      ],
    );
  }
}

class MobileField extends ConsumerWidget {
  const MobileField({
    super.key,
    required this.mobileController,
  });

  final PhoneController mobileController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vmProvider = passwordResetViewModelProvider;
    final viewmodel = ref.watch(vmProvider);
    return Row(
      children: [
        Radio(
          value: 1,
          groupValue: viewmodel.selectedOption.value,
          onChanged: (value) {
            ref
                .read(vmProvider.notifier)
                .updateSelectedOption(ResetOption.PHONE);
          },
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: PhoneFormField(
              controller: mobileController,
              decoration: const InputDecoration(
                labelText: 'Mobile Number',
                border: UnderlineInputBorder(),
              ),
              showFlagInInput: true,
              defaultCountry: IsoCode.EG,
              validator: (phoneNumber) {
                if (viewmodel.selectedOption == ResetOption.PHONE &&
                    phoneNumber?.isValid() != true) {
                  return "Please enter a valid phone number";
                }
                return null;
              },
              onChanged: (value) {
                final m = mobileController.value;
                if (m == null || m.nsn.isEmpty) return;
                final phoneModel = PhoneModel(
                  countryCode: int.parse(m.countryCode),
                  number: int.parse(m.nsn),
                );
                ref.read(vmProvider.notifier).updatePhoneNumber(phoneModel);
              },
            ),
          ),
        ),
      ],
    );
  }
}
