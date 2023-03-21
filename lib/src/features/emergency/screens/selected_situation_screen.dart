import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project/src/features/data/models/emergency.dart';

class SelectedSituationScreen extends StatelessWidget {

  static const String screenRoute = "/selectedSituation";

  const SelectedSituationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    final Emergency emergency = ModalRoute.of(context)!.settings.arguments as Emergency;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          emergency.name,
          style: TextStyle(
            fontSize: 21,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth/18, vertical: 10),
            child: const Text("First Steps",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: screenWidth/18, vertical: screenHeight/50),
            margin: EdgeInsets.symmetric(horizontal: screenWidth/18, vertical: screenHeight/100),
            height: screenHeight/5,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  width: 1,
                )
            ),
            child: Text(
              emergency.content.trim(),
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth/18, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Find a facility",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),Text("Near me",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: screenHeight/4,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (context, index){
                  return InkWell(
                    onTap: (){
                      //Navigator.pushNamed(context, SelectedFacilityScreen.screenRoute);
                    },
                    child: Container(
                      width: screenWidth/1.5,
                      padding: EdgeInsets.symmetric(horizontal: screenWidth/40, vertical: screenHeight/50),
                      margin: EdgeInsets.symmetric(horizontal: screenWidth/35, vertical: screenHeight/100),
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
                              Text('Kasarani Hosp',
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
          ),
        ],
      ),
    );
  }
}
