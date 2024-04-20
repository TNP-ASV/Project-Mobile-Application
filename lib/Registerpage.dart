import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:watchshop/Homepage.dart';
import 'package:watchshop/Loginpage.dart';
import 'package:watchshop/Navigation_Bar.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String _name = "";
  String _email = "";
  String _password = "";

  void _handleSignUp() async {
    if (_password != null &&
        nameController.text != "" &&
        emailController.text != "" &&
        passwordController.text != "") {
      try {
        UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
          email: _email,
          password: _password,
        );

        createUserDocument(userCredential);

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            "Registered Successfully",
            style: TextStyle(fontSize: 20.0),
          ),
        ));
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => NavigationScreen()),
        );
        print("User Registered: ${userCredential.user!.email}");
      } catch (e) {
        print("Error During Registration: $e");
      }
    }
  }

  Future<void> createUserDocument(UserCredential? userCredential) async {
    if (userCredential != null && userCredential.user != null) {
      await FirebaseFirestore.instance
          .collection("Users")
          .doc(userCredential.user!.email)
          .set({
        'email': userCredential.user!.email,
        'name': nameController.text,
      });
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            child: Text(
              "Register",
              style: TextStyle(
                color: const Color.fromARGB(255, 0, 0, 0),
                fontSize: 90,
                fontFamily: 'Licorice',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: nameController,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Name",
                      labelStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0),
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
                    style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please Enter Your Name";
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        _name = value;
                      });
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Email",
                      labelStyle: TextStyle(color: const Color.fromARGB(255, 0, 0, 0),
                      fontFamily: 'MateSC',
                      ),
                      filled: true,
                      fillColor: Color.fromARGB(255, 255, 255, 255).withOpacity(0.9),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 12.0,
                      ),
                      prefixIcon: Icon(Icons.mail, color:Colors.black),
                    ),
                    style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
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
                    controller: passwordController,
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
                      prefixIcon: Icon(Icons.lock, color:Colors.black),
                    ),
                    style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
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
                        _handleSignUp();
                      }
                    },
                    child: Container(
                      width: 100,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Center(
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                            color: const Color.fromARGB(255, 0, 0, 0),
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'MateSC',
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Loginoption(),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}


Row Loginoption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Already have a Member?",
            style: TextStyle(color: Color.fromRGBO(255, 0, 0, 0.612),
            fontFamily: 'MateSC',
            )),
        GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Loginpage()));
            },
            child: const Text(" Sign IN",
                style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 0.612),
                    fontWeight: FontWeight.bold,
                    fontFamily: 'MateSC',
                    ))),
      ],
    );
  }
}
