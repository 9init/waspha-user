import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:waspha/core/const/cahce_keys/cache_keys.dart';
import 'package:waspha/src/core/di/index.dart';

import 'firebase_options.dart';
import 'src/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Future.delayed(const Duration(milliseconds: 150));

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await configureDependencies();
  await Hive.initFlutter();
  await Hive.openBox(CacheKeys.userLocation); // Open a box to store user location
  runApp(const ProviderScope(child: MyApp()));
}
