import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../screens/specialists_screen.dart';

class SpecialistView extends StatefulWidget {
  String title;
   SpecialistView({required this.title});

  @override
  State<SpecialistView> createState() => _SpecialistViewState();
}

class _SpecialistViewState extends State<SpecialistView> {
  late var width;
  late var height;

  @override


  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: 10,right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.title,
                style: const TextStyle(
                    color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SpecialistScreen()));

                },
                child: Text(
                  'See All',
                  style: const TextStyle(
                      color: Colors.black, fontSize: 13, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 120,
          child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
              scrollDirection: Axis.horizontal,
              itemCount: 7,
              itemBuilder: (context, index) {

                return GestureDetector(
                  onTap: () {
                   showSpecialistInfo(context);
                     },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      width: width *0.6,
                      margin: EdgeInsets.only(left: 3,right: 5),
                      padding:EdgeInsets.all(18),
                      color: Colors.grey,

                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: 30,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Dr Felix Sichangi'),
                                SizedBox(height:5),
                                Text('Gynaecologist')
                              ],
                            ),


                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
        )
      ],
    );
  }
  showSpecialistInfo(BuildContext context, ) {
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.only(top: 0),
          backgroundColor: Colors.grey,
          content: Container(
            child: Wrap(
              alignment: WrapAlignment.start,
              children: [
                Container(
                  width: width*0.75,
                  margin: EdgeInsets.only(left: 10,top: 10,bottom: 10),
                  height: 80,
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 35,
                      ),
                      SizedBox(width: 10,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Dr Samir Sichangi'),
                          SizedBox(height:5),
                          Text('Gynaecologist')
                        ],
                      ),


                    ],
                  ),
                ),

                Container(
                  width: width*0.75,
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    'Gynecologists are medical professionals who specialize in the female reproductive system, including the uterus, ovaries, and vagina. They provide a wide range of healthcare services, including routine check-ups, prenatal care, family planning, and treatment for reproductive disorders.',
                    maxLines: 10,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                )
              ],
            ),
          ),
          actions: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {

                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0),
                    child: Container(
                      height: 35,
                      width: width*0.75,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          SizedBox(
                            width: 1,
                          ),
                          Icon(
                            Icons.chat_bubble,
                            color: Colors.black,
                            size: 24,
                          ),
                          Text(
                            'Chat',
                            style: TextStyle(color: Colors.black, fontSize: 15),
                          ),
                          SizedBox(
                            width: 1,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

              ],
            )
          ],
        );
      },
    );
  }

}
