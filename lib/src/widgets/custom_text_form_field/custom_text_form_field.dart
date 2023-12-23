import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class CustomTextFromField extends StatelessWidget {
  const CustomTextFromField({
    Key? key,
    required this.textEditingController,
    this.onChanged,
    this.onTap,
    this.onFieldSubmitted,
    this.onSaved,
    this.validator,
    this.labelText,
    this.fieldName,
    this.maxLines,
    this.minLines,
    this.textInputAction,
    this.hintText,
  }) : super(key: key);
  final TextEditingController textEditingController;
  final Function(String?)? onChanged;
  final GestureTapCallback? onTap;
  final ValueChanged<String?>? onFieldSubmitted;
  final Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final String? labelText;
  final String? fieldName;
  final int? maxLines;
  final int? minLines;
  final String? hintText;

  final TextInputAction? textInputAction;

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: fieldName ?? '',
      textInputAction: textInputAction ?? null,
      controller: textEditingController,
      onChanged: onChanged,
      validator: validator,
      maxLines: maxLines,
      minLines: minLines,
      decoration: InputDecoration(
        border: InputBorder.none,
        labelText: labelText,
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.labelSmall,
      ),
    );
  }
}
