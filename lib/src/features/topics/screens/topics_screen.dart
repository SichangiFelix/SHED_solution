import 'package:flutter/material.dart';

class TopicsScreen extends StatelessWidget {

  static const String screenRoute = "/topics";

  const TopicsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    TextEditingController _searchTextFieldController = TextEditingController();
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: -screenWidth/12,
            child: Container(
              width: 260,
              height: 270,
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(100),topRight: Radius.circular(200), bottomRight: Radius.circular(80), bottomLeft: Radius.circular(200))
              ),
            ),
          ),Positioned(
            top: screenHeight/10,
            right: -screenWidth/14,
            child: Container(
              width: 231,
              height: 204,
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(200),topRight: Radius.circular(180), bottomRight: Radius.circular(200), bottomLeft: Radius.circular(180))
              ),
            ),
          ),Positioned(
            top: screenHeight/2.5,
            right: screenWidth/30,
            child: Container(
              width: 101,
              height: 109,
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                borderRadius: BorderRadius.circular(100),
              ),
            ),
          ),Positioned(
            top: screenHeight/1.6,
            right: -screenWidth/60,
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                borderRadius: BorderRadius.circular(60),
              ),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                Align(
                    alignment: Alignment.center,
                    child: Text("Lets learn",
                      style: TextStyle(
                        fontSize: 22,
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Hero(
                    tag: "hero_search",
                    child: Container(
                      height: screenHeight * 0.05,
                      width: screenWidth * 0.8,
                      padding: EdgeInsets.only(left: 20),
                      decoration: BoxDecoration(
                          border: const Border(
                            left: BorderSide(color: Colors.grey,width: 2,),
                            right: BorderSide(color: Colors.grey,width: 2,),
                            top: BorderSide(color: Colors.grey,width: 2,),
                            bottom: BorderSide(color: Colors.grey,width: 2,),
                          ) ,
                          color: Colors.white12,
                          borderRadius: BorderRadius.circular(15.0)),
                      child: Material(
                        color: Colors.transparent,
                        child: TextField(
                          controller: _searchTextFieldController,
                          decoration: const InputDecoration(
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              hintStyle: TextStyle(
                                color: Colors.black,
                              ),
                              filled: false,
                              fillColor: Colors.black,
                              hintText: 'Search Topics'),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
