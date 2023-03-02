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
            // Container(
            //  decoration: const BoxDecoration(
            //    image: DecorationImage(image: NetworkImage('https://wallpapercave.com/dwp1x/wp5534738.jpg',),fit: BoxFit.cover)
            //  ),
            // ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: EdgeInsets.only(bottom: screenHeight / 10),
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
                      SizedBox(
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
              left: screenWidth/30,
              child: Container(
                  margin: const EdgeInsets.only(left: 15, right: 15, top: 50),
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
