import 'package:flutter/material.dart';
import 'package:project/src/common/widgets/auth_input_field.dart';
import 'package:project/src/common/widgets/long_blue_button.dart';

import '../common/otp_field.dart';
import '../common/text_style.dart';

class OtpPage extends StatelessWidget {

  TextEditingController controller = TextEditingController();

  OtpPage({Key? key}) : super(key: key);

  //Controllers for otp values
  TextEditingController otp1 = TextEditingController();
  TextEditingController otp2 = TextEditingController();
  TextEditingController otp3 = TextEditingController();
  TextEditingController otp4 = TextEditingController();
  TextEditingController otp5 = TextEditingController();
  TextEditingController otp6 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('OTP', style: AuthTextStyle.pageHeader,),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: (screenWidth - screenWidth/1.15)/2),
        child: Column(
          children: [
            SizedBox(height: screenHeight/10,),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text("Enter the 6 digit code sent to your email ****@gmail.com",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(height: screenHeight/30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                OtpField(controller: otp1,),
                OtpField(controller: otp2),
                OtpField(controller: otp3),
                OtpField(controller: otp4),
                OtpField(controller: otp5),
                OtpField(controller: otp6),
              ],
            ),
            SizedBox(height: screenHeight/20,),
            LongBlueButton(buttonName: "Confirm", press: (){}),
          ],
        ),
      ),
    );
  }
}
