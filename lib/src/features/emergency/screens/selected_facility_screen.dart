import 'package:flutter/material.dart';

class SelectedFacilityScreen extends StatelessWidget {

  static const String screenRoute = "/selectedFacility";

  List<String> emergencySituations = [
    'Injury',
    'Condom Breakage',
    'Rape',
    'Unprotected Contact',
    'STI infection',
    '....'
  ];

  SelectedFacilityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("KU Health Unit",
          style: TextStyle(
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
                  child: ListView.builder(
                      itemBuilder: (context, index){
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: screenHeight/100, horizontal: screenWidth/18),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text("Testing",
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              Text("Lorem ipsum dolor sit amet, consectetur adipiscing"
                                  " elit, sed do eiusmod tempor incididunt ut labore et"
                                  " dolore magna aliqua.",
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        );
                      }
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
                  child: const Text("KU University Nairobi County along Thika Super Highway",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: screenHeight/12,),
                  width: screenWidth,
                  height: screenHeight/2,
                  color: Colors.black12,
                  child: Center(child: Text("Map view")),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: screenHeight/12,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                  width: screenWidth/3,
                  child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                  textStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  ),
                  ),
                  onPressed: (){}, child: Text("Call",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ), )),Container(
                  width: screenWidth/3,
                  child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                  textStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  ),
                  ),
                  onPressed: (){}, child: Text("Directions",
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
