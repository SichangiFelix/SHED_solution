import 'package:flutter/material.dart';
import 'package:project/src/common/widgets/auth_input_field.dart';
import 'package:project/src/common/widgets/long_blue_button.dart';
import 'package:project/src/features/authentication/authservices/reset_password_service.dart';
import 'package:project/src/features/authentication/screens/login_page.dart';

import '../authservices/AuthExceptionHandler.dart';
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
        title: const Text('Forgot Password', style: AuthTextStyle.pageHeader,),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: (screenWidth - screenWidth/1.15)/2),
        child: Column(
          children: [
            SizedBox(height: screenHeight/10,),
            const Align(
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
            LongBlueButton(
                buttonName: "Continue",
                press: () async {
              final status = await ResetPasswordService().resetPassword(controller.text);
              if(status == AuthStatus.successful){
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Password reset link sent to your email, sign in with new password")));
                Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));
              } else {
                final errorMsg = AuthExceptionHandler.generateErrorMessage(status);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(errorMsg)));
              }
            }),
          ],
        ),
      ),
    );
  }
}
