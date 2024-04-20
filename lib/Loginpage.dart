import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:watchshop/Homepage.dart';
import 'package:watchshop/Registerpage.dart';
import 'package:watchshop/Navigation_Bar.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailControler = TextEditingController();
  TextEditingController _passControler = TextEditingController();

  String _email = "";
  String _password = "";

  void _handleLogin() async{
    try{
      UserCredential userCredential = 
        await _auth.signInWithEmailAndPassword(
          email: _email,
          password: _password,
      );
      Navigator.push(context, MaterialPageRoute(builder: (context)=>NavigationScreen()));
      print("User Logged In: ${userCredential.user!.email}");
    } catch (e) {
      print("Error During Logged In: $e");
    }
  }
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/BG_01.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Welcome",
                style: TextStyle(
                  color: const Color.fromARGB(255, 0, 0, 0),
                  fontSize: 90,
                  fontFamily: 'Licorice',
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: _emailControler,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Email",
                        labelStyle: TextStyle(color: const Color.fromARGB(255, 0, 0, 0),
                        fontFamily: 'MateSC',
                        ),
                        filled: true,
                        fillColor: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.9),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 8.0,
                          horizontal: 12.0,
                        ),
                        prefixIcon: Icon(Icons.person, color:Colors.black),
                      ),
                      style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Enter Your Email";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          _email = value;
                        });
                      },
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: _passControler,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Password",
                        labelStyle: TextStyle(color: const Color.fromARGB(255, 0, 0, 0),
                        fontFamily: 'MateSC',
                        ),
                        filled: true,
                        fillColor: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.9),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 8.0,
                          horizontal: 12.0,
                        ),
                        prefixIcon: Icon(Icons.lock, color: Colors.black),
                      ),
                      style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Enter Your Password";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          _password = value;
                        });
                      },
                    ),
                    SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          _handleLogin();
                        }
                      },
                      child: Container(
                        width: 100,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Center(
                          child: Text(
                            "Login",
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontFamily: 'MateSC',
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    signupoption(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}


  Row signupoption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Don't have an account? ",
          style: TextStyle(color: Color.fromARGB(255, 255, 0, 0),
          fontFamily: 'MateSC',
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Register()),
            );
          },
          child: const Text(
            "Sign Up",
            style: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontWeight: FontWeight.bold,
              fontFamily: 'MateSC',
            ),
          ),
        ),
      ],
    );
  }
}