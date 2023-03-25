import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:project/src/common/statemanager/theme_mode_manager.dart';
import 'package:project/src/features/authentication/authservices/auth_page.dart';
import 'package:project/src/features/emergency/screens/emergency_facilities_screen.dart';
import 'package:project/src/features/emergency/screens/emergency_situations_screen.dart';
import 'package:project/src/features/emergency/screens/selected_facility_screen.dart';
import 'package:project/src/features/emergency/screens/selected_situation_screen.dart';
import 'package:project/src/features/home/screens/home_screen.dart';
import 'package:project/src/features/topics/screens/topic_content_screen.dart';
import 'package:project/src/features/topics/screens/topics_screen.dart';
import 'firebase_options.dart';
import 'src/features/landing/splash_page.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(SplashPage(key:UniqueKey(),onInitializationComplete: ()=>runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeModeManager>(
          create: (context) => ThemeModeManager(),
        ),
      ],
      child: const MyApp()
  ))));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: FlexThemeData.light(
        colors: const FlexSchemeColor(
          primary: Color(0xff1c1c98),
          primaryContainer: Color(0xffd0e4ff),
          secondary: Color(0xff1c1c98),
          secondaryContainer: Color(0xffffdbcf),
          tertiary: Color(0xff5f5f5f),
          tertiaryContainer: Color(0xff95f0ff),
          appBarColor: Color(0xffffdbcf),
          error: Color(0xffb00020),
        ),
        surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
        blendLevel: 9,
        appBarStyle: FlexAppBarStyle.surface,
        subThemesData: const FlexSubThemesData(
          blendOnLevel: 10,
          blendOnColors: false,
          textButtonSchemeColor: SchemeColor.onSecondaryContainer,
          elevatedButtonSchemeColor: SchemeColor.secondary,
          outlinedButtonSchemeColor: SchemeColor.onPrimaryContainer,
          outlinedButtonOutlineSchemeColor: SchemeColor.onBackground,
          switchSchemeColor: SchemeColor.onPrimaryContainer,
          switchThumbSchemeColor: SchemeColor.secondaryContainer,
          unselectedToggleIsColored: true,
          inputDecoratorSchemeColor: SchemeColor.tertiary,
          appBarBackgroundSchemeColor: SchemeColor.onPrimary,
          bottomNavigationBarSelectedLabelSchemeColor: SchemeColor.primary,
          bottomNavigationBarUnselectedLabelSchemeColor: SchemeColor.onSecondaryContainer,
          bottomNavigationBarSelectedIconSchemeColor: SchemeColor.primary,
          bottomNavigationBarUnselectedIconSchemeColor: SchemeColor.onSecondaryContainer,
          bottomNavigationBarBackgroundSchemeColor: SchemeColor.onSecondary,
          bottomNavigationBarOpacity: 0.96,
          bottomNavigationBarElevation: 11.0,
          navigationBarBackgroundSchemeColor: SchemeColor.primaryContainer,
        ),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        fontFamily: "Poppins",
      ),
      themeMode: context.watch<ThemeModeManager>().selectedTheme,
      darkTheme: FlexThemeData.dark(
        colors: const FlexSchemeColor(
          primary: Color(0xff9fc9ff),
          primaryContainer: Color(0xff00325b),
          secondary: Color(0xffffb59d),
          secondaryContainer: Color(0xff872100),
          tertiary: Color(0xff86d2e1),
          tertiaryContainer: Color(0xff004e59),
          appBarColor: Color(0xff872100),
          error: Color(0xffcf6679),
        ),
        surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        blendLevel: 15,
        subThemesData: const FlexSubThemesData(
          blendOnLevel: 20,
          textButtonSchemeColor: SchemeColor.onSecondaryContainer,
          elevatedButtonSchemeColor: SchemeColor.secondary,
          outlinedButtonSchemeColor: SchemeColor.onPrimaryContainer,
          outlinedButtonOutlineSchemeColor: SchemeColor.onBackground,
          switchSchemeColor: SchemeColor.onPrimaryContainer,
          switchThumbSchemeColor: SchemeColor.secondaryContainer,
          unselectedToggleIsColored: true,
          tabBarItemSchemeColor: SchemeColor.secondary,
          tabBarIndicatorSchemeColor: SchemeColor.secondary,
          bottomNavigationBarSelectedLabelSchemeColor: SchemeColor.primary,
          bottomNavigationBarUnselectedLabelSchemeColor: SchemeColor.onSecondaryContainer,
          bottomNavigationBarSelectedIconSchemeColor: SchemeColor.primary,
          bottomNavigationBarUnselectedIconSchemeColor: SchemeColor.onSecondaryContainer,
          bottomNavigationBarBackgroundSchemeColor: SchemeColor.onSecondary,
          bottomNavigationBarOpacity: 0.96,
          bottomNavigationBarElevation: 11.0,
          navigationBarBackgroundSchemeColor: SchemeColor.primaryContainer,
        ),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        fontFamily: "Poppins",
      ),
      initialRoute: AuthPage.screenRoute,
      routes: {
        //Auth
        AuthPage.screenRoute : (context) => const AuthPage(),
        //Home
        HomeScreen.screenRoute : (context) => const HomeScreen(),
        //Emergency
        EmergencySituationsScreen.screenRoute : (context) => EmergencySituationsScreen(),
        EmergencyFacilitiesScreen.screenRoute : (context) => EmergencyFacilitiesScreen(),
        SelectedFacilityScreen.screenRoute : (context) => SelectedFacilityScreen(),
        SelectedSituationScreen.screenRoute : (context) => const SelectedSituationScreen(),
        //Topics
        TopicsScreen.screenRoute : (context) => const TopicsScreen(),
        TopicContent.screenRoute : (context) => const TopicContent(),
      },
    );
  }
}

//AuthPage()