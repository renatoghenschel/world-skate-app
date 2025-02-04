import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyAYn0Uic3BAhML-MHa7lBMTCG7GcVkCNrs",
            authDomain: "social-meida-app-u-i-at2zxs.firebaseapp.com",
            projectId: "social-meida-app-u-i-at2zxs",
            storageBucket: "social-meida-app-u-i-at2zxs.appspot.com",
            messagingSenderId: "496465838346",
            appId: "1:496465838346:web:e5de93913966982aff7af3"));
  } else {
    await Firebase.initializeApp();
  }
}
