import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:number_login/Pages/auth_screen.dart';
import 'package:number_login/Pages/otp_screen.dart';
import 'package:number_login/Pages/profile_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(46, 59, 98, 1),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AuthScreen(),
    );
  }
}
