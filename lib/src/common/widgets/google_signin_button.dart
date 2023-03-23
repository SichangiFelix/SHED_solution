import 'package:flutter/material.dart';

class GoogleSigninButton extends StatelessWidget {

  VoidCallback press;
  String text;

  GoogleSigninButton({
    required this.text,
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
                textStyle: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
                alignment: Alignment.centerRight,
                side: const BorderSide(
                  width: 1,
                )
            ),
            onPressed: press,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               const Icon(Icons.g_mobiledata, color: Colors.green, size: 40,),
                const SizedBox(
                  width: 10,
                ),
                Text(text)
              ],
            )));
  }
}