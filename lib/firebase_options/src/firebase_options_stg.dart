// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options_stg.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptionsStg {
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
    apiKey: 'AIzaSyDamJEkz2Ar6BHaV30sIlSy5s5tTqHEatQ',
    appId: '1:632984663255:web:9a3ad619bb171ed5ecec92',
    messagingSenderId: '632984663255',
    projectId: 'flutther-stg',
    authDomain: 'flutther-stg.firebaseapp.com',
    storageBucket: 'flutther-stg.appspot.com',
    measurementId: 'G-DMXEQHRGFT',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDm9qwIvbOQ87fS0xAzYq0gcgoy7_DERy4',
    appId: '1:632984663255:android:c1d95d08a3254d3becec92',
    messagingSenderId: '632984663255',
    projectId: 'flutther-stg',
    storageBucket: 'flutther-stg.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDlXXxN_Qz14zdFc4_K5GOiYswnnYinjqw',
    appId: '1:632984663255:ios:4330115ae6c7099eecec92',
    messagingSenderId: '632984663255',
    projectId: 'flutther-stg',
    storageBucket: 'flutther-stg.appspot.com',
    iosBundleId: 'xyz.ezragunn.flutther-stg',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDlXXxN_Qz14zdFc4_K5GOiYswnnYinjqw',
    appId: '1:632984663255:ios:4330115ae6c7099eecec92',
    messagingSenderId: '632984663255',
    projectId: 'flutther-stg',
    storageBucket: 'flutther-stg.appspot.com',
    iosBundleId: 'xyz.ezragunn.flutther-stg',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDamJEkz2Ar6BHaV30sIlSy5s5tTqHEatQ',
    appId: '1:632984663255:web:4ced7402cdbcafbbecec92',
    messagingSenderId: '632984663255',
    projectId: 'flutther-stg',
    authDomain: 'flutther-stg.firebaseapp.com',
    storageBucket: 'flutther-stg.appspot.com',
    measurementId: 'G-GQP8NQNNR0',
  );

}