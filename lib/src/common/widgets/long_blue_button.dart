import 'package:flutter/material.dart';

class LongBlueButton extends StatelessWidget {

  VoidCallback press;
  String buttonName;

  LongBlueButton({
    required this.buttonName,
    required this.press,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
        width: screenWidth/1.15,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            textStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
          ),
          onPressed: press, child: Text(buttonName), ));
  }
}