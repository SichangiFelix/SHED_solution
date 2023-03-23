import 'package:flutter/material.dart';

class MeetingView extends StatefulWidget {
  String title;
   MeetingView({required this.title});

  @override
  State<MeetingView> createState() => _MeetingViewState();
}

class _MeetingViewState extends State<MeetingView> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
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
          height: 165,
          child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
              scrollDirection: Axis.horizontal,
              itemCount: 7,
              itemBuilder: (context, index) {

                return ClipRRect(
                  borderRadius: BorderRadius.circular(22),
                  child: Container(
                    width: width *0.6,
                    margin: const EdgeInsets.only(left: 3,right: 5),
                    color: Colors.grey,
                    padding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
                    child: GestureDetector(
                      onTap: () {
                       // Navigator.push(context, MaterialPageRoute(builder: (context)=>SpecialistScreen()));
                      },
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text('Sexual Health Talk'),
                            Text('Dr Samir Mohammed'),
                            SizedBox(height: 30),
                            Text('12th Feb 2023')
                          ],
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
