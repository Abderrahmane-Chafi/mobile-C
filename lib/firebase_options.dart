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
    apiKey: 'AIzaSyC2A0NpOj2RVYzXBFnE39wQ99AZW-YewL8',
    appId: '1:124431001477:web:f5b386c6ca84d7a47006ec',
    messagingSenderId: '124431001477',
    projectId: 'mobileapp3a',
    authDomain: 'mobileapp3a.firebaseapp.com',
    storageBucket: 'mobileapp3a.firebasestorage.app',
    measurementId: 'G-GY1MGWDSLS',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBkg34qTKRZthr6iJwkxa58tBtWncAn5VE',
    appId: '1:124431001477:android:367805422bbb42357006ec',
    messagingSenderId: '124431001477',
    projectId: 'mobileapp3a',
    storageBucket: 'mobileapp3a.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB_vsVrfm02bBo_nigY3mDdUu680S911JU',
    appId: '1:124431001477:ios:82c5cf9e882b29817006ec',
    messagingSenderId: '124431001477',
    projectId: 'mobileapp3a',
    storageBucket: 'mobileapp3a.firebasestorage.app',
    iosBundleId: 'com.example.finalp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB_vsVrfm02bBo_nigY3mDdUu680S911JU',
    appId: '1:124431001477:ios:82c5cf9e882b29817006ec',
    messagingSenderId: '124431001477',
    projectId: 'mobileapp3a',
    storageBucket: 'mobileapp3a.firebasestorage.app',
    iosBundleId: 'com.example.finalp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyC2A0NpOj2RVYzXBFnE39wQ99AZW-YewL8',
    appId: '1:124431001477:web:743da3d8cc37cf897006ec',
    messagingSenderId: '124431001477',
    projectId: 'mobileapp3a',
    authDomain: 'mobileapp3a.firebaseapp.com',
    storageBucket: 'mobileapp3a.firebasestorage.app',
    measurementId: 'G-CSLFTDKLJK',
  );

}