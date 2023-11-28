import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:waspha/src/features/common/auth/auth_container.dart';
import 'package:waspha/src/features/common/auth_btn/auth_btn.dart';
import 'package:waspha/src/features/common/custome_form/custom_form.dart';
import 'package:waspha/src/features/pass_reset/viewmodel.dart';
import 'package:waspha/src/models/loading_state/loading_state.dart';

class ResetPassword extends ConsumerWidget {
  ResetPassword({super.key, required this.followUpCode});

  final String followUpCode;
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loadingState = ref.watch(passwordChangeNotifierProvider).state;

    ref.listen(passwordChangeNotifierProvider, (_, res) {
      if (res.state == LoadingState.success) {
        context.go("/login");
      }

      if (res.state == LoadingState.error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(res.message!),
          ),
        );
      }
    });

    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            const WasphaHeader(
              title1: "Password",
              title2: "Recovery",
              title2Size: 30,
              backButtonEnabled: false,
            ),
            const Spacer(),
            const Text(
              "Reset Password",
              style: TextStyle(
                color: Colors.indigo,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            CustomFormField(
              controller: _passwordController,
              text: "Password",
              isPassword: true,
              onChanged: (value) {},
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Enter a password";
                }
                return null;
              },
            ),
            const SizedBox(
              height: 30,
            ),
            CustomFormField(
              controller: _confirmPasswordController,
              text: "Re-enter Password",
              isPassword: true,
              onChanged: (value) {},
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Enter a confirmation password";
                }

                if (value != _passwordController.value.text) {
                  return "Passwords do not match";
                }

                return null;
              },
            ),
            const SizedBox(
              height: 50,
            ),
            AuthButton(
              onTap: () {
                if (loadingState == LoadingState.loading) return;
                if (_formKey.currentState?.validate() ?? false) {
                  // Call the password change function
                  ref
                      .read(passwordChangeNotifierProvider.notifier)
                      .changePassword(
                        _passwordController.text,
                        followUpCode,
                      );
                }
              },
              text: loadingState == LoadingState.loading
                  ? "Loading..."
                  : "Continue",
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
