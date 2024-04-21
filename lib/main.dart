import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:watchshop/Homepage.dart';
import 'package:watchshop/Loginpage.dart';
// import 'package:watchshop/Loginpage.dart';
// import 'package:watchshop/Searchpage.dart';
// import 'package:watchshop/Registerpage.dart';
// import 'package:watchshop/ProfilePage.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
  );
    runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
 @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Welcome",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Color.fromRGBO(0, 96, 57, 100)),
      home: Loginpage(),
    );
  }
}