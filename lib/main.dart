import 'package:flutter/material.dart';
import 'dart:async';  
import 'package:laundry_app/screens/home_screen/home_screen.dart';
import 'package:laundry_app/screens/login_screen/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:laundry_app/screens/login_screen/login_screen_viewmodel.dart';
import 'package:laundry_app/screens/order_screen.dart/orderScreen1_viewmodel.dart';
import 'package:laundry_app/screens/order_screen.dart/order_screen.dart';
import 'package:laundry_app/screens/order_screen.dart/order_screen1.dart';
import 'package:laundry_app/screens/order_screen.dart/order_screen2.dart';
import 'package:laundry_app/screens/order_screen.dart/order_screen3.dart';
import 'package:laundry_app/screens/splash_screen/splash_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  print("firebase initialised");
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          unselectedWidgetColor: Colors.transparent,
          primarySwatch: Colors.blue,
          primaryColor: Color(0xffD7EF7D),
          secondaryHeaderColor: Color(0xff11044C),
          scaffoldBackgroundColor: Color(0xffF5F4EE),
          textTheme: const TextTheme(
            headline1: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
              color: Color(0xff11044C)),
            headline2: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 18,
              color: Color(0xff11044C),
              fontWeight: FontWeight.w300,
            ),
            headline3: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Color(0xff11044C)),
            labelMedium: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.w300,), 
          
        ),),
        home: LoginScreen());
  }
}


// ChangeNotifierProvider<OrderScreen1ViewModel>(
//           create: ((context) {
//             return OrderScreen1ViewModel();
//           }),
//           builder: ((context, child) {
//             return SafeArea(child: OrderScreen1());
//           }),
//         )

//////////////
// ChangeNotifierProvider<LoginScreenViewmodel>(
//           create: ((context) {
//             return LoginScreenViewmodel();
//           }),
//           builder: ((context, child) {
//             return SafeArea(child: LoginScreen());
//           }),
//         )





