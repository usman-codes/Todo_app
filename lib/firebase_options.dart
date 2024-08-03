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
    apiKey: 'AIzaSyBqxqcLCtlz8ajfO04hJvPadTKdy1Jj0Io',
    appId: '1:667836851823:web:31e300a19405f956ea4f9a',
    messagingSenderId: '667836851823',
    projectId: 'todo-app-f7dfc',
    authDomain: 'todo-app-f7dfc.firebaseapp.com',
    storageBucket: 'todo-app-f7dfc.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAVij9u2tkk_hg-dRZwh2rmkWEevUAEluQ',
    appId: '1:667836851823:android:a28dcde333ac8b6bea4f9a',
    messagingSenderId: '667836851823',
    projectId: 'todo-app-f7dfc',
    storageBucket: 'todo-app-f7dfc.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCU6SO7_pGC8-yJN6a8otk5Z_H20yI-VBI',
    appId: '1:667836851823:ios:3cac8a03ccd79f1cea4f9a',
    messagingSenderId: '667836851823',
    projectId: 'todo-app-f7dfc',
    storageBucket: 'todo-app-f7dfc.appspot.com',
    iosBundleId: 'com.example.todoApp',
  );
}