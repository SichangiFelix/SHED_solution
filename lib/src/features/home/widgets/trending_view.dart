import 'package:flutter/material.dart';

import '../../data/services/trending_services.dart';

class TrendingView extends StatefulWidget {
  String title;
   TrendingView({required this.title});

  @override
  State<TrendingView> createState() => _TrendingViewState();
}

class _TrendingViewState extends State<TrendingView> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: Text(
            widget.title,
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          height: 50,
          child: StreamBuilder(
              stream: TrendingServices().getTrends(),
            builder: ( context,  snapshot) {
                if(snapshot.hasData) {
                  List trends = snapshot.data!.docs;
                  return ListView.builder(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 8),
                      scrollDirection: Axis.horizontal,
                      itemCount: 7,
                      itemBuilder: (context, index) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(35),
                          child: Container(
                            margin: const EdgeInsets.only(left: 3, right: 5),
                            // color: Colors.grey,
                            padding:
                            const EdgeInsets.symmetric(
                                vertical: 0, horizontal: 8),
                            child: GestureDetector(
                                onTap: () {

                                   },
                                child: Container(
                                  width: 120,
                                  decoration: BoxDecoration(
                                    border: const Border(
                                      left: BorderSide(
                                        color: Colors.grey, width: 1,),
                                      right: BorderSide(
                                        color: Colors.grey, width: 1,),
                                      top: BorderSide(
                                        color: Colors.grey, width: 1,),
                                      bottom: BorderSide(
                                        color: Colors.grey, width: 1,),
                                    ),
                                    borderRadius: BorderRadius.circular(35),
                                  ),
                                  child: Center(
                                    child: Text('#' + trends[index].data()['topic']),
                                  ),
                                )
                            ),
                          ),
                        );
                      });
                }
                return Container(
                  height: height*0.08,
                    child: Center(child: Text('No Trending Topics')));
  }
          ),
        )
      ],
    );
  }
}
