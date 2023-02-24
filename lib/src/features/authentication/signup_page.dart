import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignUpPage extends StatefulWidget{

  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  // email and password from user input
  final String name = "Test Subject";
  final String emailAddress = "example@gmail.com";
  final String password = "Test@1234";
  final String confirmPassword = "Test@1234";

  // Verify password and confirm password match

  bool verifyPassword() {
    if (password == confirmPassword) {
      return true;
    } else {
      return false;
    }
  }


  // Sign in with email and password method
  Future<void> createUserWithEmailAndPassword() async {
    if (verifyPassword()) {
      try {
        final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
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
    } else {
      print("Passwords do not match");
    }
  }

  // Sign in with Google method
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              // create user with email and password
              createUserWithEmailAndPassword();
            }, child: const Text("Sign In")),
      ),
    );
  }


}