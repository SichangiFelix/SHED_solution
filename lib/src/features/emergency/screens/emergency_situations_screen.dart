import 'package:flutter/material.dart';

class EmergencySituationsScreen extends StatelessWidget {

  static const String screenRoute = "/emergencySituations";

  List<String> emergencySituations = [
    'Injury',
    'Condom Breakage',
    'Rape',
    'Unprotected Contact',
    'STI infection',
    '....'
  ];

  EmergencySituationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
          itemCount: emergencySituations.length,
          itemBuilder: (context, index){
            return InkWell(
              onTap: (){
                if(index == 0){
                  //Navigator.pushNamed(context, EmergencySituationsScreen.screenRoute);
                }else{
                  //Navigator.pushNamed(context, EmergencySituationsScreen.screenRoute);
                }
              },
              child: Container(
                margin: EdgeInsets.only(left: 12,right: 12, top: screenHeight/100),
                height: screenHeight/16,
                decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: 1,
                      ),
                    )
                ),
                child: Row(
                  children: [
                    Container(
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                        color: const Color(0xffEDEDED),
                          borderRadius: BorderRadius.circular(5)
                      ),
                    ),
                    const SizedBox(width: 15,),
                    Text(emergencySituations[index],
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
      ),
    );
  }
}
