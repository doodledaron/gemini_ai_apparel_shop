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
    apiKey: 'AIzaSyCcCBrNB5QxX51Yk77IPvawbgBLScG5c80',
    appId: '1:560593660290:web:c4bee9ef90e4af994e479b',
    messagingSenderId: '560593660290',
    projectId: 'gemini-ai-apparel-app',
    authDomain: 'gemini-ai-apparel-app.firebaseapp.com',
    storageBucket: 'gemini-ai-apparel-app.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDotT-9MTy6ZzPScc1pVV-GCqxIy0u_dMk',
    appId: '1:560593660290:android:b145921c23fd49964e479b',
    messagingSenderId: '560593660290',
    projectId: 'gemini-ai-apparel-app',
    storageBucket: 'gemini-ai-apparel-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCfN38zBY34xIfObmnsVILQnqkG7C-fPao',
    appId: '1:560593660290:ios:38c9aeef514bc7244e479b',
    messagingSenderId: '560593660290',
    projectId: 'gemini-ai-apparel-app',
    storageBucket: 'gemini-ai-apparel-app.appspot.com',
    iosBundleId: 'com.example.geminiAiApparelShop',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCfN38zBY34xIfObmnsVILQnqkG7C-fPao',
    appId: '1:560593660290:ios:38c9aeef514bc7244e479b',
    messagingSenderId: '560593660290',
    projectId: 'gemini-ai-apparel-app',
    storageBucket: 'gemini-ai-apparel-app.appspot.com',
    iosBundleId: 'com.example.geminiAiApparelShop',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCcCBrNB5QxX51Yk77IPvawbgBLScG5c80',
    appId: '1:560593660290:web:127dd9ffc4540dea4e479b',
    messagingSenderId: '560593660290',
    projectId: 'gemini-ai-apparel-app',
    authDomain: 'gemini-ai-apparel-app.firebaseapp.com',
    storageBucket: 'gemini-ai-apparel-app.appspot.com',
  );

}