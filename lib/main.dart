import 'package:chatapp/auth/firebase_options.dart';
import 'package:chatapp/auth/login.dart';
import 'package:chatapp/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

//https://fbauth-c0740.firebaseapp.com/__/auth/handler
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // if (Firebase.apps.length <= 0) {
  //   Firebase.app();
  // } else {
  await Firebase.initializeApp();
  // }
  runApp(const MyApp());
}

class TestApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginPage(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator(); // Placeholder widget while waiting for authentication state
        }
        if (snapshot.hasData && snapshot.data != null) {
          // User is logged in
          return const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Home(),
          );
        } else {
          // User is logged out
          return const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: LoginPage(),
          );
        }
      },
    );
  }
}
