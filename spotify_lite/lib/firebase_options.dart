// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return macos;
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
    apiKey: 'AIzaSyA4tihUHf1N64ffpkaFBHbYG_hBJ03Ax5Q',
    appId: '1:828298419404:web:36f50af0fcc158c4adb669',
    messagingSenderId: '828298419404',
    projectId: 'spotify-lite-8ddac',
    authDomain: 'spotify-lite-8ddac.firebaseapp.com',
    storageBucket: 'spotify-lite-8ddac.appspot.com',
    measurementId: 'G-6EES44EL1P',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDu95WCsYNxuEkp2rLnCX0iFX9t1ql-bDM',
    appId: '1:828298419404:android:23774bb0ef1a3318adb669',
    messagingSenderId: '828298419404',
    projectId: 'spotify-lite-8ddac',
    storageBucket: 'spotify-lite-8ddac.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBFCyeq5D5bqi-omBbkmNtINyCb1cKbIUU',
    appId: '1:828298419404:ios:1af2668a9351dc13adb669',
    messagingSenderId: '828298419404',
    projectId: 'spotify-lite-8ddac',
    storageBucket: 'spotify-lite-8ddac.appspot.com',
    iosBundleId: 'com.example.spotifyLite',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBFCyeq5D5bqi-omBbkmNtINyCb1cKbIUU',
    appId: '1:828298419404:ios:1af2668a9351dc13adb669',
    messagingSenderId: '828298419404',
    projectId: 'spotify-lite-8ddac',
    storageBucket: 'spotify-lite-8ddac.appspot.com',
    iosBundleId: 'com.example.spotifyLite',
  );
}
