import 'package:flutter/material.dart';

import '../authentication/screens/login_page.dart';
import '../authentication/screens/signup_page.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Container(
             decoration: BoxDecoration(
               image: DecorationImage(image: AssetImage("assets/images/land_image.png"),fit: BoxFit.cover)
             ),
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: screenWidth/1.05,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white.withOpacity(0.3),
                  ),
                  margin: EdgeInsets.only(bottom: screenHeight/10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: screenWidth / 2.5,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const LoginPage()));
                            },
                            child: const Text(
                              "Sign In",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                            )),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      SizedBox(
                        width: screenWidth / 2.5,
                        child: OutlinedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const SignupPage()));
                            },
                            child: const Text("Sign Up",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                            )),
                      ),
                    ],
                  ),
                )),
            Positioned(
              top: screenHeight/10,
              child: Container(
                width: screenWidth/1.05,
                  margin: EdgeInsets.only(left: (screenWidth-screenWidth/1.05)/2, right: (screenWidth-screenWidth/1.05)/2, top: 50),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white.withOpacity(0.3),
                  ),
                  child: const Text(
                    'Educating the Public on \n'
                    'Sexual Health Information \n'
                    '& Awareness',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 21,
                        fontWeight: FontWeight.w600),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
