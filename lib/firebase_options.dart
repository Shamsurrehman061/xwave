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
    apiKey: 'AIzaSyCwbOKp3tEem31whbzLoPC8nplHoKBUvTg',
    appId: '1:777372145776:web:9d803174185b4d38937cb5',
    messagingSenderId: '777372145776',
    projectId: 'xwave-de2ea',
    authDomain: 'xwave-de2ea.firebaseapp.com',
    storageBucket: 'xwave-de2ea.appspot.com',
    measurementId: 'G-L91XB57J9J',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyChJVlsZZ2TOkaDvGW8DhzUI757IFHj-eQ',
    appId: '1:777372145776:android:c8410f914a625564937cb5',
    messagingSenderId: '777372145776',
    projectId: 'xwave-de2ea',
    storageBucket: 'xwave-de2ea.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB_1EaB-zvLBLKsr4j46qi4ejPpljDF-rQ',
    appId: '1:777372145776:ios:3d05b34f60bdff47937cb5',
    messagingSenderId: '777372145776',
    projectId: 'xwave-de2ea',
    storageBucket: 'xwave-de2ea.appspot.com',
    iosBundleId: 'com.example.xWave',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB_1EaB-zvLBLKsr4j46qi4ejPpljDF-rQ',
    appId: '1:777372145776:ios:2271be53db9d1b6d937cb5',
    messagingSenderId: '777372145776',
    projectId: 'xwave-de2ea',
    storageBucket: 'xwave-de2ea.appspot.com',
    iosBundleId: 'com.example.xWave.RunnerTests',
  );
}
