import 'package:flutter/material.dart';
import 'package:project_application_1/HomePage.dart';
import 'package:project_application_1/Navigation_Bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Welcome",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Color.fromRGBO(0, 96, 57, 100)),
      home: NavigationScreen(),
    );
  }
}
