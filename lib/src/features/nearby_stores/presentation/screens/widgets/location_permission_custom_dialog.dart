import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:waspha/core/localization/localization.dart';
import 'package:waspha/src/widgets/custom_close_button/custom_close_button.dart';

class LocationPermissionCustomDialog extends StatelessWidget {
  const LocationPermissionCustomDialog(
      {Key? key, this.isLogged = false, required this.content})
      : super(key: key);
  final bool isLogged;
  final String content;

  @override
  Widget build(BuildContext context) {
    return AlertDialog.adaptive(
      backgroundColor: Colors.white,
      title: isLogged
          ? Text(context.localization.need_login)
          : Align(
              alignment: Alignment.topRight,
              child: CustomCloseButton(),
            ),
      actions: isLogged
          ? [
              TextButton(
                onPressed: () {
                  context.go('/login');
                },
                child: Text(
                  context.localization.login,
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ]
          : [],
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(Icons.lightbulb_outline),
          SizedBox(
            width: 20.w,
          ),
          Expanded(
            child: Text(content),
          ),
        ],
      ),
    );
  }
}
