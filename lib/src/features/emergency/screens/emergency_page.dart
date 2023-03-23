import 'package:flutter/material.dart';
import 'package:project/src/features/emergency/screens/emergency_facilities_screen.dart';

import 'emergency_situations_screen.dart';

class EmergencyPage extends StatelessWidget {
   EmergencyPage({Key? key}) : super(key: key);

  List<String> emergencySections = [
    'Emergency Situations',
    'Emergency Facilities'
  ];

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: const Text("Emergency",
        ),
      ),
      body: ListView.builder(
        itemCount: emergencySections.length,
          itemBuilder: (context, index){
            return InkWell(
              onTap: (){
                if(index == 0){
                  Navigator.pushNamed(context, EmergencySituationsScreen.screenRoute);
                }else{
                  Navigator.pushNamed(context, EmergencyFacilitiesScreen.screenRoute);
                }
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 12, vertical: screenHeight/100),
                height: screenHeight/14,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    width: 1,
                  )
                ),
                child: ListTile(
                  title: Text(emergencySections[index],
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  trailing: const Icon(Icons.chevron_right, size: 30,),
                ),
              ),
            );
          }
      ),
    );
  }
}
