import 'package:flutter/material.dart';
import 'package:project/src/features/home/screens/topic_content_screen.dart';

class TopicsGrid extends StatefulWidget {
  const TopicsGrid({Key? key}) : super(key: key);

  @override
  State<TopicsGrid> createState() => _TopicsGridState();
}

class _TopicsGridState extends State<TopicsGrid> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Container(
          margin: EdgeInsets.only(left: 20,right: 20),
          height: MediaQuery.of(context).size.height *0.9,
          child: Center(
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 1.8,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemCount: 17,
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
                            child: Text('Contraception')
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
