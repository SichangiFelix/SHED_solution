import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:project/src/features/authentication/screens/forgot_password_page.dart';

import '../../../common/widgets/auth_input_field.dart';
import '../../../common/widgets/google_signin_button.dart';
import '../../../common/widgets/long_blue_button.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../common/text_style.dart';

class LoginPage extends StatefulWidget {
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
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
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

  // Sign in with Google method
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  //Input fields controllers
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Sign in", style: AuthTextStyle.pageHeader),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: (screenWidth - screenWidth/1.15)/2),
        child: Column(
          children: [
            SizedBox(height: screenHeight/10,),
            const Align(
              alignment: Alignment.centerLeft,
                child: Text("Email", style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),)),
            AuthInputField(
              controller: emailController,
            ),
            SizedBox(height: screenHeight/70,),
            const Align(
                alignment: Alignment.centerLeft,
                child: Text("Password", style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),)),
            AuthInputField(
              controller: emailController,
            ),
            SizedBox(height: screenHeight/70,),
            Align(alignment: Alignment.centerRight,child: GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> ForgotPasswordPage()));
              },
              child: Text("Forgot Password?", style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),),
            ),),
            SizedBox(height: screenHeight/20,),
            LongBlueButton(
              press: () {

              },
              buttonName: "Sign in",
            ),
            SizedBox(height: screenHeight/50,),
            GoogleSigninButton(
                press: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset("assets/icons/google_icon.svg", width: 17.85,),
                    const SizedBox(width: 10,),
                    const Text("Sign in with Google")
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
