import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tutorial1/screens/HomeScreen.dart';
import 'package:tutorial1/screens/LoginScreen.dart';
import 'package:firebase_auth/firebase_auth.dart'; 



Future<void> main() async {
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: (FirebaseAuth.instance.currentUser == null) ? LoginScreen() : HomeScreen(),
    );
  }
}

