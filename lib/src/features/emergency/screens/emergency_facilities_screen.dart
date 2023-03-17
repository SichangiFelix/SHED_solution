import 'package:flutter/material.dart';
import 'package:project/src/features/emergency/screens/selected_facility_screen.dart';

class EmergencyFacilitiesScreen extends StatelessWidget {

  static const String screenRoute = "/emergencyFacilities";

  List<String> emergencyFacilities = [
    'KU Health Unit',
    'Kenyatta University Hospital',
    'Uhai Neema Hosp',
    'Ruiru Hosp',
    'Bypass Health Unit',
  ];

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
      body: ListView.builder(
        itemCount: emergencyFacilities.length,
          itemBuilder: (context, index){
            return InkWell(
              onTap: (){
                Navigator.pushNamed(context, SelectedFacilityScreen.screenRoute);
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: screenWidth/18, vertical: screenHeight/50),
                margin: EdgeInsets.symmetric(horizontal: 12, vertical: screenHeight/100),
                height: screenHeight/5,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      width: 1,
                    )
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(emergencyFacilities[index],
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text("Testing",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        Text("Contraception",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        Text("Sexual assault response",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        Text("Ambulance services",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(Icons.not_listed_location, size: 30,),
                        const Icon(Icons.phone, size: 30,),
                      ],
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
