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
      return web;
    }
    // ignore: missing_enum_constant_in_switch
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyC35zFG336zAu7eFpJMGf_WELtHPLPn6eg',
    appId: '1:805664732115:web:28cd404afaca5b4fff7526',
    messagingSenderId: '805664732115',
    projectId: 'tcc2022-ad5b3',
    authDomain: 'tcc2022-ad5b3.firebaseapp.com',
    storageBucket: 'tcc2022-ad5b3.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB_oB7TpErEaS76wKmdOtuZAyLgRnnt1Jg',
    appId: '1:805664732115:android:b83523f23e7c95fbff7526',
    messagingSenderId: '805664732115',
    projectId: 'tcc2022-ad5b3',
    storageBucket: 'tcc2022-ad5b3.appspot.com',
  );
}
