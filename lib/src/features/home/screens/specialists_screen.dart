import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class SpecialistScreen extends StatefulWidget {
  const SpecialistScreen({Key? key}) : super(key: key);

  @override
  State<SpecialistScreen> createState() => _SpecialistScreenState();
}

class _SpecialistScreenState extends State<SpecialistScreen> {
 late var width;
 late var height;
  @override

  Widget build(BuildContext context) {
     height = MediaQuery.of(context).size.height;
     width = MediaQuery.of(context).size.width;
    return  Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text('Specialists'),
      ),
      body: Container(
        height: height,
        width: width,
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
    scrollDirection: Axis.vertical,
    itemCount: 7,
    itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  margin: EdgeInsets.all(7),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: Colors.green
                  ),
                  child: ListTile(
                    tileColor: Colors.transparent,
                    onTap: (){
                      showSpecialistInfo(context);
                    },
                    leading: CircleAvatar(
                      radius: 27,
                      backgroundImage: NetworkImage(''),
                    ),
                    //  child: Image.network(friend['photoUrl'])),
                    title: Text('Dr. Samir Sichangi',),

                    subtitle: Container(
                      child: Text(
                        'Gynaecologist',style: const TextStyle(color: Colors.white),overflow: TextOverflow.ellipsis,
                      ),),
                  ),
                ),
                Divider(thickness: 1,color: Colors.white60,indent: 10,endIndent: 10,)
              ],
            );
    }
        ),
      ),
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
