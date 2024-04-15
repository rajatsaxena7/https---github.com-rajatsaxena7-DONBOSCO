import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBMZCvz1OtmBBSyFehjWGU3icGC7zVEb68",
            authDomain: "don-bosco-2000-fdc87.firebaseapp.com",
            projectId: "don-bosco-2000-fdc87",
            storageBucket: "don-bosco-2000-fdc87.appspot.com",
            messagingSenderId: "728824742571",
            appId: "1:728824742571:web:99dfd318c2bd45ca022dee",
            measurementId: "G-YD07WGC7NZ"));
  } else {
    await Firebase.initializeApp();
  }
}
