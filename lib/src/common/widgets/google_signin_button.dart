import 'package:flutter/material.dart';

class GoogleSigninButton extends StatelessWidget {

  VoidCallback press;
  Widget child;

  GoogleSigninButton({
    required this.child,
    required this.press,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
        width: screenWidth/1.15,
        child: OutlinedButton(
            style: OutlinedButton.styleFrom(
                alignment: Alignment.center,
                side: BorderSide(
                  width: 1,
                )
            ),
            onPressed: press,
            child: Center(child: child)));
  }
}