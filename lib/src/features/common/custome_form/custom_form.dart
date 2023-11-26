import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CustomFormField extends HookWidget {
  const CustomFormField({
    super.key,
    required this.controller,
    required this.text,
    this.isPassword = false,
    this.isOptional = false,
    this.onChanged,
    this.validator,
  });

  final TextEditingController controller;
  final String text;
  final bool isPassword;
  final bool isOptional;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    final isPassVisible = useState(false);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: TextFormField(
        controller: controller,
        validator: validator ??
            (value) {
              if (isOptional) {
                return null;
              }
              if (value!.isEmpty) {
                return "Please enter your ${text.toLowerCase()}";
              }
              return null;
            },
        obscureText: !isPassVisible.value && isPassword,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: text,
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          suffixIcon: isPassword
              ? IconButton(
                  onPressed: () => isPassVisible.value = !isPassVisible.value,
                  icon: isPassVisible.value
                      ? const Icon(Icons.visibility)
                      : const Icon(Icons.visibility_off),
                )
              : null,
          border: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
