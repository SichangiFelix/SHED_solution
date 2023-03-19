import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class TrendingView extends StatefulWidget {
  String title;
   TrendingView({required this.title});

  @override
  State<TrendingView> createState() => _TrendingViewState();
}

class _TrendingViewState extends State<TrendingView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: Text(
            widget.title,
            style: const TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          height: 50,
          child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
              scrollDirection: Axis.horizontal,
              itemCount: 7,
              itemBuilder: (context, index) {

                return ClipRRect(
                  borderRadius: BorderRadius.circular(35),
                  child: Container(
                    margin: EdgeInsets.only(left: 3,right: 5),
                   // color: Colors.grey,
                    padding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
                    child: GestureDetector(
                      onTap: () {
                        // Navigator.push(context, MaterialPageRoute(builder: (context)=>SpecialistScreen()));
                      },
                      child:Container(
                        width: 120,
                        child: Center(
                          child: Text('#Gender'),
                        ),
                        decoration:  BoxDecoration(
                          border:  Border(
                            left: BorderSide(color: Colors.grey,width: 1,),
                            right: BorderSide(color: Colors.grey,width: 1,),
                            top: BorderSide(color: Colors.grey,width: 1,),
                            bottom: BorderSide(color: Colors.grey,width: 1,),
                          ) ,
                          borderRadius: BorderRadius.circular(35),
                        ),
                      )
                    ),
                  ),
                );
              }),
        )
      ],
    );
  }
}
