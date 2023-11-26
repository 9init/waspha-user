import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OtpForm extends StatefulWidget {
  final int numberOfFields;
  final GlobalKey formKey;
  final void Function(List<String>) onOtpEntered;

  const OtpForm({
    super.key,
    required this.numberOfFields,
    required this.onOtpEntered,
    required this.formKey,
  });

  @override
  // ignore: library_private_types_in_public_api
  _OtpFormState createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  late List<TextEditingController> controllers;

  @override
  void initState() {
    super.initState();
    controllers = List.generate(
      widget.numberOfFields,
      (index) => TextEditingController(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          widget.numberOfFields,
          (index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 54,
              width: 50,
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(color: Colors.indigo),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(color: Colors.transparent),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(color: Colors.transparent),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(color: Colors.red),
                  ),
                  filled: true,
                  errorStyle: const TextStyle(fontSize: 0),
                  hintStyle: TextStyle(color: Colors.grey[400]),
                  hintText: "0",
                  fillColor: Colors.blueGrey[50],
                ),
                style: const TextStyle(fontWeight: FontWeight.bold),
                controller: controllers[index],
                onChanged: (value) {
                  if (value.length == 1) {
                    if (index < widget.numberOfFields - 1) {
                      FocusScope.of(context).nextFocus();
                    }
                    _updateOtpValues();
                  }
                },
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(1),
                  FilteringTextInputFormatter.digitsOnly,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _updateOtpValues() {
    final List<String> otpValues =
        controllers.map((controller) => controller.text).toList();
    widget.onOtpEntered(otpValues);
  }
}
