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
                textStyle: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
                alignment: Alignment.centerRight,
                side: BorderSide(
                  width: 1,
                )
            ),
            onPressed: press,
            child: child));
  }
}