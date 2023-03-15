import 'package:flutter/material.dart';
import 'package:project/src/features/authentication/authservices/auth_page.dart';
import 'package:project/src/features/authentication/authservices/login_service.dart';
import 'package:project/src/features/authentication/screens/forgot_password_page.dart';

import '../../../common/widgets/auth_input_field.dart';
import '../../../common/widgets/google_signin_button.dart';
import '../../../common/widgets/long_blue_button.dart';

import '../authservices/AuthExceptionHandler.dart';
import '../common/text_style.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  //Input fields controllers
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Sign in", style: AuthTextStyle.pageHeader),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: (screenWidth - screenWidth/1.15)/2),
          child: Column(
            children: [
              SizedBox(height: screenHeight/10,),
              const Align(
                alignment: Alignment.centerLeft,
                  child: Text("Email", style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),)),
              AuthInputField(
                controller: emailController,
              ),
              SizedBox(height: screenHeight/70,),
              const Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Password", style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),)),
              AuthInputField(
                isObsecured: true,
                controller: passwordController,
              ),
              SizedBox(height: screenHeight/70,),
              Align(alignment: Alignment.centerRight,child: GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> ForgotPasswordPage()));
                },
                child: const Text("Forgot Password?", style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),),
              ),),
              SizedBox(height: screenHeight/20,),
              LongBlueButton(
                press: () async {
                  final status = await LoginService().signInWithEmailAndPassword(emailController.text, passwordController.text);
                  if(status == AuthStatus.successful){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const AuthPage()));
                  } else {
                    final errorMsg = AuthExceptionHandler.generateErrorMessage(status);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(errorMsg)));
                  }
                },
                buttonName: "Sign in",
              ),
              SizedBox(height: screenHeight/50,),
              GoogleSigninButton(
                  press: () {
                    LoginService().signInWithGoogle();
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const AuthPage()));
                  },
                text: "Sign in with google",),
            ],
          ),
        ),
      ),
    );
  }
}
