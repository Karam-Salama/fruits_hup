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
        return windows;
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
    apiKey: 'AIzaSyBJkP2L6M88G8t-W6gFppmo1gIO_8yV1WM',
    appId: '1:1066620241323:web:fe459d7a801eb858183eee',
    messagingSenderId: '1066620241323',
    projectId: 'ecommerce-app-5b6d7',
    authDomain: 'ecommerce-app-5b6d7.firebaseapp.com',
    storageBucket: 'ecommerce-app-5b6d7.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDbM198x6nnR71ahGRNu52AF52uhDHkr2U',
    appId: '1:1066620241323:android:086a2d377f8be065183eee',
    messagingSenderId: '1066620241323',
    projectId: 'ecommerce-app-5b6d7',
    storageBucket: 'ecommerce-app-5b6d7.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCPKWvmnA2se7qjpNZ5711FyxK6ZMd482w',
    appId: '1:1066620241323:ios:b8af8a20f056ef72183eee',
    messagingSenderId: '1066620241323',
    projectId: 'ecommerce-app-5b6d7',
    storageBucket: 'ecommerce-app-5b6d7.appspot.com',
    iosBundleId: 'com.example.fruitsHup',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCPKWvmnA2se7qjpNZ5711FyxK6ZMd482w',
    appId: '1:1066620241323:ios:b8af8a20f056ef72183eee',
    messagingSenderId: '1066620241323',
    projectId: 'ecommerce-app-5b6d7',
    storageBucket: 'ecommerce-app-5b6d7.appspot.com',
    iosBundleId: 'com.example.fruitsHup',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBJkP2L6M88G8t-W6gFppmo1gIO_8yV1WM',
    appId: '1:1066620241323:web:e77bbafcf013e096183eee',
    messagingSenderId: '1066620241323',
    projectId: 'ecommerce-app-5b6d7',
    authDomain: 'ecommerce-app-5b6d7.firebaseapp.com',
    storageBucket: 'ecommerce-app-5b6d7.appspot.com',
  );
}