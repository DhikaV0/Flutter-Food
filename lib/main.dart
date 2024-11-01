import 'package:flutter/material.dart';
import 'package:food_app/pages/CartPage.dart';
import 'package:food_app/pages/HomePage.dart';
import 'package:food_app/pages/PostAdd.dart';
import 'package:food_app/pages/AddData.dart';

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
        "/": (context) => const Homepage(),
        "/CartPage": (context) => CartPage(),
        "/HomePage": (context) => Homepage(),
        "/PostAdd": (context) => PostAdd(),
        "/AddData": (context) => AddData()
      },
    );
  }
}
