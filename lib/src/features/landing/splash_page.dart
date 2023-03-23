
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashPage extends StatefulWidget {
  final VoidCallback onInitializationComplete;
  const SplashPage({Key? key, required this.onInitializationComplete}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {

    super.initState();
    Future.delayed(const Duration(seconds: 5)).then((_) => widget.onInitializationComplete());

  }
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  gradient: RadialGradient(
                     radius: 1.3,
                      stops: [
                        0.3,
                        0.9,
                        1.0,
                      ],
                      colors: [
                        Colors.white,
                        Color(0xff1C1C98),
                        Color(0xff1C1C98),
                      ]),
                ),
              ),
              const Align(
                  alignment: Alignment.center,
                  child: Text("SHED",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff1C1C98),
                    ),
                  )),
              Align(
                alignment: Alignment.center,
                child: SvgPicture.asset("assets/images/Ellipse.svg", height: 90, color: const Color(0xff1C1C98),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
