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
    apiKey: 'AIzaSyCO5pYw9e7AThw_ek__oaiqcb_M7xDg27s',
    appId: '1:1010863199796:web:5b4b725272a11368645c61',
    messagingSenderId: '1010863199796',
    projectId: 'learnverse-ebdd6',
    authDomain: 'learnverse-ebdd6.firebaseapp.com',
    databaseURL: 'https://learnverse-ebdd6-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'learnverse-ebdd6.appspot.com',
    measurementId: 'G-N8D328EPBB',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA5DChgIA354LiNFE5mNGLWYiWerum9njE',
    appId: '1:1010863199796:android:2ac8c8611c74891d645c61',
    messagingSenderId: '1010863199796',
    projectId: 'learnverse-ebdd6',
    databaseURL: 'https://learnverse-ebdd6-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'learnverse-ebdd6.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCguh6EHsXmqRdRO1zwRbq1BGaZikgvyGk',
    appId: '1:1010863199796:ios:41a3baa2df4b9ebd645c61',
    messagingSenderId: '1010863199796',
    projectId: 'learnverse-ebdd6',
    databaseURL: 'https://learnverse-ebdd6-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'learnverse-ebdd6.appspot.com',
    iosClientId: '1010863199796-0j8qhdudjf9ddf41nv43k081ad5e7ps0.apps.googleusercontent.com',
    iosBundleId: 'com.example.learnverse',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCguh6EHsXmqRdRO1zwRbq1BGaZikgvyGk',
    appId: '1:1010863199796:ios:7a21b9716bdc1021645c61',
    messagingSenderId: '1010863199796',
    projectId: 'learnverse-ebdd6',
    databaseURL: 'https://learnverse-ebdd6-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'learnverse-ebdd6.appspot.com',
    iosClientId: '1010863199796-11kaf9igr4eut43hdvvr53bcp4ssj07e.apps.googleusercontent.com',
    iosBundleId: 'com.example.learnverse.RunnerTests',
  );
}
