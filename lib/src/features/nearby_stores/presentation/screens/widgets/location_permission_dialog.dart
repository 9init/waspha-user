import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:waspha/core/localization/localization.dart';

class LocationPermissionDialog {
  Future<void> showPermissionDialog(BuildContext context) async {
    showAdaptiveDialog(
      context: context,
      builder: (context) => AlertDialog.adaptive(
        title: const Text("Location"),
        content: Text(
            "We use your location to find nearby stores, categories and products for you."),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Permission.location.request();
            },
            child: const Text(
              "Continue",
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> showCustomTrackingDialog(BuildContext context) async {
    await showAdaptiveDialog<void>(
        context: context,
        builder: (context) => AlertDialog.adaptive(
              title: Text(context.localization.dear_user),
              content: Text(context.localization.we_care_about_your_privacy),
              actions: [
                TextButton(
                  onPressed: () async {
                    Navigator.pop(context);
                    // Wait for dialog popping animation
                    await Future.delayed(const Duration(milliseconds: 200));
                    // Request system's tracking authorization dialog
                    await AppTrackingTransparency
                        .requestTrackingAuthorization();

                    bool isDenied = await Permission.location.isDenied &&
                        !await Permission.location.isRestricted;
                    if (!isDenied) showPermissionDialog(context);
                  },
                  child: const Text('Continue'),
                ),
              ],
            ));
  }
}
