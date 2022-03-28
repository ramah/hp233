// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars
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
    // ignore: missing_enum_constant_in_switch
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
    }

    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD_WhSmuhOnN_lUiZ3am_bxsgYq3y7Cck4',
    appId: '1:252584833147:android:66c16fc041e999812832de',
    messagingSenderId: '252584833147',
    projectId: 'hpo233',
    storageBucket: 'hpo233.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCqNL6j_JKTfXuKlqqy1sF3UMO2tNJuXD4',
    appId: '1:252584833147:ios:ceb4464ff93df78d2832de',
    messagingSenderId: '252584833147',
    projectId: 'hpo233',
    storageBucket: 'hpo233.appspot.com',
    iosClientId: '252584833147-7uuqmp4ato29r6j9j367qudqld7j1rib.apps.googleusercontent.com',
    iosBundleId: 'com.henry.poitier.rge',
  );
}
