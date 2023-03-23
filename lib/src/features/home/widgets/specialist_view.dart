
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project/src/features/data/services/specialist_services.dart';

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
     width = MediaQuery.of(context).size.width;
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.title,
                style: const TextStyle(
                    color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
              ),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SpecialistScreen()));
                },
                child: Text(
                  "See All",
                  style: const TextStyle(
                      color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),

            ],
          ),
        ),
        Container(
          height: 120,
          child: StreamBuilder(
            stream: SpecialistServices().getSpecialists(),
            builder: (context, snapshot) {
              if (snapshot.hasData){
                List specialists = snapshot.data!.docs;
                return  ListView.builder(
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                    scrollDirection: Axis.horizontal,
                    itemCount: specialists.length,
                    itemBuilder: (context, index) {

                     return InkWell(
                        onTap: () {
                          //Show specialist info via modal that gives option to navigate to chat screen
                          showSpecialistInfo(
                               specialty: specialists[index].data()["name"],
                               name: specialists[index].data()["specialty"],
                               description: specialists[index].data()["description"],
                              context: context
                          );
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
                                      Text(specialists[index].data()['name']),
                                      SizedBox(height:5),
                                      Text(specialists[index].data()['specialty']),
                                    ],
                                  ),


                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    });
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

            },

          )
        )
      ],
    );
  }
  showSpecialistInfo({required BuildContext context,required String specialty,required String name,required String description} ) {
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
                          Text(name),
                          SizedBox(height:5),
                          Text(specialty)
                        ],
                      ),


                    ],
                  ),
                ),

                Container(
                  width: width*0.75,
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Text(description
                    , maxLines: 10,
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


