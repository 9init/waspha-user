import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:waspha/src/utils/cache_helper.dart';
import 'package:waspha/src/widgets/need_location.dart';

import 'firebase_options.dart';
import 'src/app.dart';
import 'src/features/nearby_stores/domain/location.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  bool isGranted = await isLocationGranted();
  if (isGranted) {
    runApp(const ProviderScope(child: MyApp()));
  } else {
    runApp(NeedLocationPermission());
  }
  await CacheHelper.init();
}
