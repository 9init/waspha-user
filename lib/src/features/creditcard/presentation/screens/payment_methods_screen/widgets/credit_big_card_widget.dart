import 'package:flutter/material.dart';

class CredBigCardWidget extends StatelessWidget {
  const CredBigCardWidget({
    super.key,
    required this.text,
    required this.header,
    required this.textButton,
    required this.onTextButtonClick,
  });

  final String text, header, textButton;
  final VoidCallback onTextButtonClick;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 348,
      height: 248,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                spreadRadius: 1)
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 0, left: 20),
            child: Text(header,
                style:
                const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(
            height: 5,
          ),
          ListTile(
            leading: const Icon(Icons.credit_card),
            title: Text(text),
            trailing: const Icon(Icons.arrow_forward),
          ),
          ListTile(
            leading: const Icon(
              Icons.add,
              size: 30,
            ),
            onTap: onTextButtonClick,
            title: Text(
              textButton,
              style: const TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
