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
    apiKey: 'AIzaSyDUvHPdrh5NT_CG6TsUTW2dvQG67BkdRoU',
    appId: '1:847842548743:web:e5b58a8b51f9fab17e5ea2',
    messagingSenderId: '847842548743',
    projectId: 'chatapp-c3e71',
    authDomain: 'chatapp-c3e71.firebaseapp.com',
    storageBucket: 'chatapp-c3e71.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA1mAYlkuftFebJawMJKdAyAwnKEZcNmJ4',
    appId: '1:847842548743:android:8674d314bc4f915c7e5ea2',
    messagingSenderId: '847842548743',
    projectId: 'chatapp-c3e71',
    storageBucket: 'chatapp-c3e71.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAey1jsp12hJAHcD-J6e6EZORHqoD-bHbs',
    appId: '1:847842548743:ios:b34bacb9ff7446dc7e5ea2',
    messagingSenderId: '847842548743',
    projectId: 'chatapp-c3e71',
    storageBucket: 'chatapp-c3e71.appspot.com',
    iosBundleId: 'com.example.chatapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAey1jsp12hJAHcD-J6e6EZORHqoD-bHbs',
    appId: '1:847842548743:ios:d8f161df71c57fc87e5ea2',
    messagingSenderId: '847842548743',
    projectId: 'chatapp-c3e71',
    storageBucket: 'chatapp-c3e71.appspot.com',
    iosBundleId: 'com.example.chatapp.RunnerTests',
  );
}
