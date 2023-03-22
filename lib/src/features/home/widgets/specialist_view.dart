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

  @override


  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
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
                  "Explore More",
                  style: const TextStyle(
                      color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 120,
          child: StreamBuilder<QuerySnapshot>(
            stream: SpecialistServices().getSpecialists(),
            builder: (context, snapshot) {
              if (snapshot.hasData){
                List specialists = snapshot.data!.docs;
                return  ListView.builder(
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                    scrollDirection: Axis.horizontal,
                    itemCount: specialists.length,
                    itemBuilder: (context, index) {

                     return GestureDetector(
                        onTap: () {
                          //Navigate to individual specialist screen
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
}
