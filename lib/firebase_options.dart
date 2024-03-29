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
      return web;
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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBn-psJ-2H4AL4uM6rAeXo1Urmx32ZUoyU',
    appId: '1:169711096126:web:9a7dffb4a4a5fff44bdc6f',
    messagingSenderId: '169711096126',
    projectId: 'timetracker-83156',
    authDomain: 'timetracker-83156.firebaseapp.com',
    storageBucket: 'timetracker-83156.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDapXPMsHu8pcgl6PeX-nuRm_If1q2O0-k',
    appId: '1:169711096126:android:d85d408b5aa0ae404bdc6f',
    messagingSenderId: '169711096126',
    projectId: 'timetracker-83156',
    storageBucket: 'timetracker-83156.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC5TE9mCLaRNv6_d_W8ojJ2ruYNvIFkzcc',
    appId: '1:169711096126:ios:522aac95f1358f2a4bdc6f',
    messagingSenderId: '169711096126',
    projectId: 'timetracker-83156',
    storageBucket: 'timetracker-83156.appspot.com',
    iosBundleId: 'com.timeTracker.timeTracker',
  );
}
