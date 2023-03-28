import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project/src/features/data/models/emergency.dart';
import 'package:project/src/features/data/services/emergency_facilities.dart';
import 'package:project/src/features/emergency/screens/selected_facility_screen.dart';

class EmergencyFacilitiesScreen extends StatelessWidget {

  static const String screenRoute = "/emergencyFacilities";


  EmergencyFacilitiesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Facilities",
          style: TextStyle(
            fontSize: 21,
          ),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: EmergencyFacilities().getEmergencyFacilities(),
        builder: (context, snapshot) {
            if(snapshot.hasData){
              List facilities = snapshot.data!.docs;

              return ListView.builder(
                  itemCount: facilities.length,
                  itemBuilder: (context, index){
                    return InkWell(
                      onTap: (){

                        Navigator.pushNamed(context, SelectedFacilityScreen.screenRoute, arguments: Facility(
                            facilities[index].data()['phonenumber'],
                            name: facilities[index].data()['name'] ,
                            services: facilities[index].data()['services'],
                            location: facilities[index].data()['location'])
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: screenWidth/18, vertical: screenHeight/50),
                        margin: EdgeInsets.symmetric(horizontal: 12, vertical: screenHeight/100),
                        height: screenHeight/5,
                        constraints: BoxConstraints(
                          minHeight: 150,
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              width: 1,
                              color: Theme.of(context).primaryColor,
                            )
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 9,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(facilities[index].data()['name'],
                                    maxLines: 2,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ) ,
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      for (var i = 0; i < 3; i++)
                                        Text(facilities[index].data()['services'][i],
                                          style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(Icons.not_listed_location, size: 30,color: Theme.of(context).primaryColor,),
                                  Icon(Icons.phone, size: 30, color: Theme.of(context).primaryColor,),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
              );

            }else{
            return const Center(
              child: CircularProgressIndicator(),
            );
            }
          }
      ),
    );
  }
}
