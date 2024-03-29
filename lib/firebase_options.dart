// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDm-WrjWHSZ1CKxRkgIcXSmDpeGVAUNKOM',
    appId: '1:254995855199:android:f835cc7a03a1a394f568ea',
    messagingSenderId: '254995855199',
    projectId: 'waspha-b0ef3',
    databaseURL: 'https://waspha-b0ef3.firebaseio.com',
    storageBucket: 'waspha-b0ef3.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBS6oVVmQ07hPxsWzZ8jTw6DCJoCo9yBfo',
    appId: '1:254995855199:ios:e6d1b915394ce908f568ea',
    messagingSenderId: '254995855199',
    projectId: 'waspha-b0ef3',
    databaseURL: 'https://waspha-b0ef3.firebaseio.com',
    storageBucket: 'waspha-b0ef3.appspot.com',
    androidClientId: '254995855199-386bas36hm6u9m8s9bc2q4mqq6a4r6ns.apps.googleusercontent.com',
    iosClientId: '254995855199-85bol1lrctp3tjcadmevd9s1a7hp9mc4.apps.googleusercontent.com',
    iosBundleId: 'com.waspha.user.sg',
  );
}
