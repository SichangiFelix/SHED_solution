import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:project/src/features/topics/screens/topics_screen.dart';

class TopicView extends StatefulWidget {
  String title;
   TopicView({required this.title});

  @override
  State<TopicView> createState() => _TopicViewState();
}

class _TopicViewState extends State<TopicView> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.title,
                style: const TextStyle(
                    color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
              ),InkWell(
                onTap: (){
                  Navigator.pushNamed(context, TopicsScreen.screenRoute);
                },
                child: Text(
                  "Explore More",
                  style: const TextStyle(
                      color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 20,right: 20),
          height: MediaQuery.of(context).size.height *0.3,
          child: Center(
            child: GridView(
              padding: EdgeInsets.symmetric(horizontal: screenWidth/16),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.2,
                    crossAxisSpacing: screenWidth/10,
                    mainAxisSpacing: 10),
              children: [
                Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        //color: Color(0xff06B782),
                        gradient: LinearGradient(
                          colors: [
                            Color(0xff13DEA0),
                            Color(0xff06B782),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Image(
                        image: AssetImage("assets/images/curve1.png"),
                      ),
                    ),Align(
                      alignment: Alignment.bottomCenter,
                      child: Image(
                        image: AssetImage("assets/images/curve 2.png"),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                          child: Text('Sexual\nHealth')
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        //color: Color(0xff06B782),
                        gradient: LinearGradient(
                          colors: [
                            Color(0xffFC67A7),
                            Color(0xffF6815B),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Image(
                        image: AssetImage("assets/images/curve1.png"),
                      ),
                    ),Align(
                      alignment: Alignment.bottomCenter,
                      child: Image(
                        image: AssetImage("assets/images/curve 2.png"),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                          child: Text('Sexual\nHealth')
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        //color: Color(0xff06B782),
                        gradient: LinearGradient(
                          colors: [
                            Color(0xff441DFC),
                            Color(0xff4E81EB),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Image(
                        image: AssetImage("assets/images/curve1.png"),
                      ),
                    ),Align(
                      alignment: Alignment.bottomCenter,
                      child: Image(
                        image: AssetImage("assets/images/curve 2.png"),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                          child: Text('Sexual\nHealth')
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        //color: Color(0xff06B782),
                        gradient: LinearGradient(
                          colors: [
                            Color(0xffFFD541),
                            Color(0xffF0B31A),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Image(
                        image: AssetImage("assets/images/curve1.png"),
                      ),
                    ),Align(
                      alignment: Alignment.bottomCenter,
                      child: Image(
                        image: AssetImage("assets/images/curve 2.png"),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                          child: Text('Sexual\nHealth')
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
