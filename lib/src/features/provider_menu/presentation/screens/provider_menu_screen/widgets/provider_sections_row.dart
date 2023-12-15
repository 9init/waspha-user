import 'package:flutter/material.dart';
import 'package:waspha/core/localization/localization.dart';

class ProviderSectionRow extends StatelessWidget {
  const ProviderSectionRow(
      {Key? key, required this.sectionName, required this.seeAllCallBack})
      : super(key: key);
  final String sectionName;
  final VoidCallback seeAllCallBack;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(sectionName),
        TextButton(
          onPressed: seeAllCallBack,
          child: Text(context.localization.see_all),
        )
      ],
    );
  }
}
