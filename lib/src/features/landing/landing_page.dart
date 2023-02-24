import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            //Image
            Column(
              children: [
                Text('Educating the Public On Sexual Health Information & Awareness'),
                Row(
                  children: [
                    ElevatedButton(onPressed: (){}, child: Text("Sign in")),
                    OutlinedButton(onPressed: (){}, child: Text("Sign up")),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
