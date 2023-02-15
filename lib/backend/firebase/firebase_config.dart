import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBphJedZrSOhyHKE6xVCjXmguYCwB0zyYM",
            authDomain: "chalicefirebase.firebaseapp.com",
            projectId: "chalicefirebase",
            storageBucket: "chalicefirebase.appspot.com",
            messagingSenderId: "708108624655",
            appId: "1:708108624655:web:52961e3cc9b97e9299d47a"));
  } else {
    await Firebase.initializeApp();
  }
}
