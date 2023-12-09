import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'routes/routes.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (_, child) {
        return MaterialApp.router(
          routerConfig: ref.read(router),
          debugShowCheckedModeBanner: false,
          title: 'WASPHA',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
        );
      },
    );
  }
}
