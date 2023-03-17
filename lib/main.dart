import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:project/src/features/authentication/authservices/auth_page.dart';
import 'package:project/src/features/emergency/screens/emergency_facilities_screen.dart';
import 'package:project/src/features/emergency/screens/emergency_situations_screen.dart';
import 'package:project/src/features/emergency/screens/selected_facility_screen.dart';
import 'package:project/src/features/emergency/screens/selected_situation_screen.dart';
import 'package:project/src/features/home/screens/home_screen.dart';
import 'firebase_options.dart';
import 'src/features/landing/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(SplashPage(key:UniqueKey(),onInitializationComplete: ()=>runApp(MyApp())));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        fontFamily: "Poppins",
        primarySwatch: Colors.blue,
      ),
      initialRoute: AuthPage.screenRoute,
      routes: {
        //Auth
        AuthPage.screenRoute : (context) => AuthPage(),
        //Home
        HomeScreen.screenRoute : (context) => HomeScreen(),
        //Emergency
        EmergencySituationsScreen.screenRoute : (context) => EmergencySituationsScreen(),
        EmergencyFacilitiesScreen.screenRoute : (context) => EmergencyFacilitiesScreen(),
        SelectedFacilityScreen.screenRoute : (context) => SelectedFacilityScreen(),
        SelectedSituationScreen.screenRoute : (context) => SelectedSituationScreen(),
      },
    );
  }
}

//AuthPage()