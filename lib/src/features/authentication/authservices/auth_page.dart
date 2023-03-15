import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project/src/features/home/screens/home_screen.dart';

import '../../landing/landing_page.dart';





class AuthPage extends StatelessWidget{

  static const String screenRoute = "/authPage";
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            return HomeScreen();
          } else {
            return const LandingPage();
          }
        },
      ),
    );
  }
}

