import 'package:flutter/material.dart';

class CredCardWidget extends StatelessWidget {
  const CredCardWidget({
    super.key,
    required this.amount,
    required this.currency,
  });

  final String amount, currency;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () => context.push('/credit_detail'),
      child: Container(
        width: 164,
        height: 121,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[400]!),
            borderRadius: BorderRadius.circular(18),
            gradient: const LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topCenter,
                colors: [
                  Colors.grey,
                  Colors.grey,
                  Colors.white,
                ])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "$currency Wallet",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              "$currency $amount",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: EdgeInsets.only(right: 30.0),
              child: Align(
                  alignment: Alignment.bottomRight,
                  child: Icon(Icons.arrow_forward)),
            ),
          ],
        ),
      ),
    );
  }
}
