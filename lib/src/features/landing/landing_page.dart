import 'package:flutter/material.dart';


import '../authentication/screens/login_page.dart';
import '../authentication/screens/signup_page.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Stack(
          children: [

            Container(

             decoration: const BoxDecoration(
               image: DecorationImage(image: NetworkImage('https://wallpapercave.com/dwp1x/wp5534738.jpg',),fit: BoxFit.cover)
             ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: const EdgeInsets.only(left: 50,right: 50,bottom: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                        onPressed:(){
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context)=>const LoginPage()));
                        }, child: const Text("Sign In")),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>const SignupPage()));

                        }, child: const Text("Sign Up")),
                  ],
                ),
              )
            ),
            Align(
              alignment: Alignment.topCenter,
                child:Container(
                  margin: const EdgeInsets.only(left: 15,right: 15,top: 50),
                  child:const Text('Educating the Public on \n '
                      'Sexual Health Information \n'
                      '& Awareness',style: TextStyle(
                      color: Colors.white,fontSize: 26,fontWeight: FontWeight.bold),)
                ),

            )
          ],
        ),
      ),
    );
  }
}
