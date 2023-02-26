import 'package:flutter/material.dart';

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
      home: Center(
        child: Stack(
          children: [
            Container(

              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomLeft,
                    colors: [
                      Colors.blue,
                      Colors.blue.shade50,
                      Colors.white
                    ]),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Icon(Icons.circle_outlined,size: 70,),
            )
          ],
        ),
      ),
    );
  }
}
