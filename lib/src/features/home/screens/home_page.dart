import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Home content"),
        ElevatedButton(onPressed: () async{
          await FirebaseAuth.instance.signOut();
        }, child: const Text("Logout")),
      ],
    );
   }
}
