import 'package:flutter/material.dart';
import 'package:project/src/features/data/models/emergency.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SelectedFacilityScreen extends StatelessWidget {

  static const String screenRoute = "/selectedFacility";



  SelectedFacilityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    final Facility facility = ModalRoute.of(context)!.settings.arguments as Facility;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:  Text(
          facility.name,
          style: const TextStyle(
            fontSize: 21,
          ),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth/18, vertical: 10),
                  child: const Text("Services offered",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                Container(
                  height: screenHeight/3,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: screenHeight/100, horizontal: screenWidth/18),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          for (var service in facility.services)
                            Text(
                              service,
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                        ]
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth/18, vertical: 10),
                  child: const Text("Location",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth/18, vertical: 10),
                  child:  Text(
                    facility.location,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: screenHeight/12,),
                  width: screenWidth,
                  height: screenHeight/2,
                  color: Colors.black12,
                  child: const Center(child: Text("Map view")),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: screenHeight/12,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                  width: screenWidth/3,
                  child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  ),
                  ),
                  onPressed: (){

                  }, child: const Text("Call",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ), )),Container(
                  width: screenWidth/3,
                  child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  ),
                  ),
                  onPressed: (){}, child: const Text("Directions",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ), )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
