import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:waspha/src/app.dart';
import 'package:waspha/src/features/profile/presentation/profile.dart';

class NeedLocationPermission extends StatelessWidget {
  const NeedLocationPermission({super.key});
  @override
  Widget build(BuildContext context) {
    print("hello");
    return MaterialApp(
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
