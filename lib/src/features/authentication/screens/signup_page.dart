import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:project/src/features/authentication/screens/forgot_password_page.dart';

import '../../../common/widgets/auth_input_field.dart';
import '../../../common/widgets/google_signin_button.dart';
import '../../../common/widgets/long_blue_button.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../common/text_style.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
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
        title: const Text("Sign up", style: AuthTextStyle.pageHeader),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: (screenWidth - screenWidth/1.15)/2),
        child: Column(
          children: [
            SizedBox(height: screenHeight/10,),
            const Align(
                alignment: Alignment.centerLeft,
                child: Text("Name", style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),)),
            AuthInputField(
              controller: emailController,
            ),
            SizedBox(height: screenHeight/70,),
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
            const Align(
                alignment: Alignment.centerLeft,
                child: Text("Confirm Password", style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),)),
            AuthInputField(
              controller: emailController,
            ),
            SizedBox(height: screenHeight/20,),
            LongBlueButton(
              press: () {

              },
              buttonName: "Sign up",
            ),
            SizedBox(height: screenHeight/50,),
            GoogleSigninButton(
                press: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset("assets/icons/google_icon.svg", width: 17.85,),
                    const SizedBox(width: 10,),
                    const Text("Sign up with Google")
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
