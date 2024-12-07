import 'package:flutter/material.dart';
import 'package:food_app/pages/CartPage.dart';
import 'package:food_app/pages/HomePage.dart';
import 'package:food_app/pages/PostAdd.dart';
import 'package:food_app/pages/AddData.dart';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Makanan',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: const Color(0xffff5f5f3)),
      routes: {
  "/": (context) => const SplashScreen(),
  "/HomePage": (context) => const Homepage(),
  "/CartPage": (context) => CartPage(),
  "/PostAdd": (context) => PostAdd(),
  "/AddData": (context) => AddData(
        onSubmit: (data) {
          // Tambahkan logika untuk menangani data
          print("Data diterima: $data");
        },
      ),
    },
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to HomePage after 3 seconds
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, "/HomePage");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset('images/logo.png',
          width: 150,
          height: 150,
        ),
      ),
    );
  }
}
