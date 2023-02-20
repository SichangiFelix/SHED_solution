import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget{

  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  // email and password from user input
  final String emailAddress = "test@gmail.com";
  final String password = "Test@1234";

  // Sign in with email and password method
  void signUserIn() async {

    // try sign-in
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
           email: emailAddress,
           password: password
           );
      final user = credential.user;
      print(user?.email);

    } on FirebaseAuthException catch (e) {
      // handle no user found error
      if (e.code == 'user-not-found') {
        print('No user found for that email.');

      // handle wrong password error
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            signUserIn();
            }, child: null),
      ),
    );
  }
}