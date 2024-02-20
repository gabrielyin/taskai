import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyAm7eVIM8ApP11h_Wr6JzQEq7o2WjhIiwk",
            authDomain: "taskai-50e91.firebaseapp.com",
            projectId: "taskai-50e91",
            storageBucket: "taskai-50e91.appspot.com",
            messagingSenderId: "874592364748",
            appId: "1:874592364748:web:6f28d5fa5b8289b5877a69"));
  } else {
    await Firebase.initializeApp();
  }
}
