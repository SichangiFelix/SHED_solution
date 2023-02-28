import 'package:flutter/material.dart';

class AuthInputField extends StatelessWidget {

  TextEditingController controller;
  bool? isObsecured = false;
  String? inputType;

  AuthInputField({
    Key? key,
    required this.controller,
    this.isObsecured,
    this.inputType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: screenWidth/1.15,
      height: screenHeight/35,
      child: TextFormField(
        obscureText: isObsecured == null? false:isObsecured!,
        controller: controller,
        decoration: const InputDecoration(
            border: UnderlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                )
            ),

            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                )
            )
        ),
      ),
    );
  }
}