import 'package:flutter/material.dart';
import 'package:project/src/features/authentication/screens/login_page.dart';
import 'package:project/src/features/authentication/screens/signup_page.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: screenHeight,
              width: screenWidth,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: (screenWidth - screenWidth/1.15)/2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(height: screenHeight/10,),
                  const Text(
                    'Educating the Public On Sexual Health Information & Awareness',
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Expanded(child: SizedBox.shrink()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          width: screenWidth / 2.5,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                textStyle: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const LoginPage()));
                              },
                              child: const Text("Sign in"))),
                      Container(
                          width: screenWidth / 2.5,
                          child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                  textStyle: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  side: const BorderSide(
                                    width: 1,
                                  )),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const SignupPage()));
                              },
                              child: const Text("Sign up"))),
                    ],
                  ),
                  SizedBox(height: screenHeight/10,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
