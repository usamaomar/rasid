import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyD49fBtT2uZrGP1r7t5llxHMMqweJn3EGE",
            authDomain: "rasid-999fc.firebaseapp.com",
            projectId: "rasid-999fc",
            storageBucket: "rasid-999fc.appspot.com",
            messagingSenderId: "360177815791",
            appId: "1:360177815791:web:e09ebded3d9428a9a2cb1a",
            measurementId: "G-FN2FNHENCS"));
  } else {
    await Firebase.initializeApp();
  }
}
