import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project/src/features/authentication/authservices/signup_service.dart';

import '../../../common/widgets/auth_input_field.dart';
import '../../../common/widgets/google_signin_button.dart';
import '../../../common/widgets/long_blue_button.dart';
import '../authservices/auth_page.dart';
import '../authservices/login_service.dart';
import '../common/text_style.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  //Input fields controllers
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

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
        padding: EdgeInsets.symmetric(
            horizontal: (screenWidth - screenWidth / 1.15) / 2),
        child: Column(
          children: [
            SizedBox(
              height: screenHeight / 10,
            ),
            const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Name",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                )),
            AuthInputField(
              controller: nameController,
            ),
            SizedBox(
              height: screenHeight / 70,
            ),
            const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Email",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                )),
            AuthInputField(
              controller: emailController,
            ),
            SizedBox(
              height: screenHeight / 70,
            ),
            const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Password",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                )),
            AuthInputField(
              controller: passwordController,
            ),
            SizedBox(
              height: screenHeight / 70,
            ),
            const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Confirm Password",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                )),
            AuthInputField(
              controller: confirmPasswordController,
            ),
            SizedBox(
              height: screenHeight / 20,
            ),
            LongBlueButton(
              press: () {
                SignUpService().createUserWithEmailAndPassword(
                  emailController.text,
                  passwordController.text,
                  confirmPasswordController.text,
                );
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const AuthPage()));
              },
              buttonName: "Sign up",
            ),
            SizedBox(
              height: screenHeight / 50,
            ),
            GoogleSigninButton(
                press: () {
                  LoginService().signInWithGoogle();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AuthPage()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      "assets/icons/google_icon.svg",
                      width: 17.85,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text("Sign up with Google")
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
