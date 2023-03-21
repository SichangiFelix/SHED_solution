import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project/src/features/data/models/emergency.dart';
import 'package:project/src/features/emergency/screens/selected_situation_screen.dart';

import '/src/features/data/services/emergency_services.dart';

class EmergencySituationsScreen extends StatelessWidget {

  static const String screenRoute = "/emergencySituations";


  EmergencySituationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    double screenHeight = MediaQuery
        .of(context)
        .size
        .height;


    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder<QuerySnapshot>(
        stream: EmergencyServices().getEmergencySituations(),
        builder: (context, snapshot){
          if(snapshot.hasData){
            List emergencies = snapshot.data!.docs;

            return ListView.builder(
                  itemCount: emergencies.length,
                  itemBuilder: (context, index){
                    return InkWell(
                      onTap: (){
                        Navigator.pushNamed(context, SelectedSituationScreen.screenRoute,
                          arguments: Emergency( emergencies[index].id,
                             name: emergencies[index].data()['name'],
                            content: emergencies[index].data()['content'],
                          ),
                        );
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
                            Text(emergencies[index].data()['name'],
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
            );
          } else{
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

        }),

      );
  }
}
