import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CustomFormField extends HookWidget {
  const CustomFormField({
    super.key,
    required this.controller,
    required this.text,
    this.isPassword = false,
    this.isOptional = false,
  });

  final TextEditingController controller;
  final String text;
  final bool isPassword;
  final bool isOptional;

  @override
  Widget build(BuildContext context) {
    final isPassVisibile = useState(false);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: TextFormField(
        controller: controller,
        validator: (value) {
          if (isOptional) {
            return null;
          }
          if (value!.isEmpty) {
            return "Please enter your ${text.toLowerCase()}";
          }
          return null;
        },
        obscureText: !isPassVisibile.value && isPassword,
        decoration: InputDecoration(
            hintText: text.toUpperCase(),
            suffixIcon: isPassword
                ? IconButton(
                    onPressed: () =>
                        isPassVisibile.value = !isPassVisibile.value,
                    icon: isPassVisibile.value
                        ? Icon(Icons.visibility)
                        : Icon(Icons.visibility_off),
                  )
                : null,
            border: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            )),
      ),
    );
  }
}
