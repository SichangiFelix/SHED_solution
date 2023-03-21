import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:project/src/features/home/screens/topics_screen.dart';

import '../screens/topic_content_screen.dart';

class TopicView extends StatefulWidget {
  String title;
   TopicView({required this.title});

  @override
  State<TopicView> createState() => _TopicViewState();
}

class _TopicViewState extends State<TopicView> {
  @override
  Widget build(BuildContext context) {
    return Column(
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>TopicScreen()));
                },
                child: Text(
                  'Explore More>',
                  style: const TextStyle(
                      color: Colors.black, fontSize: 13, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 40,right: 40),
          height: MediaQuery.of(context).size.height *0.3,
          child: Center(
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 180,
                    childAspectRatio: 1.5,
                    crossAxisSpacing: 35,
                    mainAxisSpacing: 10),
                itemCount: 4,
                itemBuilder: (BuildContext ctx, index) {
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context)=>TopicContent()));
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        height: 50,
                        width: 50,
                        color: Colors.grey,
                        child: Center(
                            child: Text('Health\nTopics')
                        ),

                      ),
                    ),
                  );
                }),
          ),
        ),
      ],
    );
  }
}
