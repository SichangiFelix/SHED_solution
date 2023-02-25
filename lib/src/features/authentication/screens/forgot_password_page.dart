import 'package:flutter/material.dart';
import 'package:project/src/common/widgets/auth_input_field.dart';
import 'package:project/src/common/widgets/long_blue_button.dart';
import 'package:project/src/features/authentication/screens/otp_page.dart';

import '../common/text_style.dart';

class ForgotPasswordPage extends StatelessWidget {

  TextEditingController controller = TextEditingController();

  ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Forgot Password', style: AuthTextStyle.pageHeader,),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: (screenWidth - screenWidth/1.15)/2),
        child: Column(
          children: [
            SizedBox(height: screenHeight/10,),
            Align(
              alignment: Alignment.centerLeft,
              child: Text("Please enter email linked to your account",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(height: screenHeight/30,),
            AuthInputField(controller: controller),
            SizedBox(height: screenHeight/20,),
            LongBlueButton(buttonName: "Continue", press: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> OtpPage()));
            }),
          ],
        ),
      ),
    );
  }
}
