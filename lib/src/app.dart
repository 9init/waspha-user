import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'routes/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'WASPHA',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        fontFamily: GoogleFonts.openSans().fontFamily,
        useMaterial3: true,
      ),
    );
  }
}
