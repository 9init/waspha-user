import 'dart:io';

import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:waspha/src/app.dart';
import 'package:waspha/src/features/profile/presentation/profile.dart';

class NeedLocationPermission extends StatelessWidget {
  const NeedLocationPermission({super.key});
  @override
  Future<void> showCustomTrackingDialog(BuildContext context) async =>
      await showDialog<void>(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Dear User'),
          content: const Text(
            'We care about your privacy and data security.'
            'We use user tracking to provide personalized advertising.'
            'By allowing tracking, you help us improve your experience.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Continue'),
            ),
          ],
        ),
      );

  Widget build(BuildContext context) {
    print("hello");
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Location Permission",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Text(
                    "We use your location to find nearby stores, categories and products for you.",
                    style: TextStyle(fontSize: 18)),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButton(
                      onPressed: () async {
                        PermissionStatus status =
                            await Permission.location.request();

                        if (status.isGranted) {
                          // If the system can show an authorization request dialog
                          if (await AppTrackingTransparency
                                  .trackingAuthorizationStatus ==
                              TrackingStatus.notDetermined) {
                            // Wait for dialog popping animation
                            await Future.delayed(
                                const Duration(milliseconds: 200));
                            // Request system's tracking authorization dialog
                            await AppTrackingTransparency
                                .requestTrackingAuthorization();
                          }

                          runApp(const ProviderScope(child: MyApp()));
                        }
                      },
                      iconNeeded: false,
                      text: "Allow Location",
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    CustomButton(
                      onPressed: () {
                        exit(0);
                      },
                      iconNeeded: false,
                      text: "Exit App",
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Center(
                  child: SvgPicture.asset(
                      "assets/images/onboarding/location.svg",
                      width: 300,
                      height: 300,
                      fit: BoxFit.cover),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
