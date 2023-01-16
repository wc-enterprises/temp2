import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:laundry_app/screens/login_screen/login_screen.dart';
import 'dart:async';

import '../home_screen/home_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(milliseconds: 2500),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => FirebaseAuth.instance.currentUser == null
                    ? LoginScreen()
                    : HomeScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(width: 200, child: Image.asset("assets/logo.png")),
      ),
    );
  }
}
