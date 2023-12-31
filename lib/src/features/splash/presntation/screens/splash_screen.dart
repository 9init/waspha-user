import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:waspha/core/assets_gen/assets.gen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isVisible = false;
  bool _isDisposed = false;

  _SplashScreenState() {
    Timer(
      const Duration(milliseconds: 3000),
      () async {
        if (_isDisposed) return; // Check if the widget has been disposed

        if (!_isDisposed) {
          context.go('/');
        }
      },
    );

    Timer(const Duration(milliseconds: 10), () {
      if (!_isDisposed) {
        // Check before setting state
        setState(() {
          _isVisible = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _isDisposed = true; // Set the flag when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [

          MyAssets.images.app.splash.svg(
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          AnimatedOpacity(
            opacity: _isVisible ? 1.0 : 0,
            duration: const Duration(milliseconds: 500),
          ),

        ],
      ),
    );
  }
}
