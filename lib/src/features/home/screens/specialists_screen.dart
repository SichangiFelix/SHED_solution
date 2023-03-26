import 'package:flutter/material.dart';
import 'package:project/src/features/data/models/specialist.dart';
import 'package:project/src/features/data/services/specialist_services.dart';

class SpecialistScreen extends StatefulWidget {
  const SpecialistScreen({Key? key}) : super(key: key);

  static const String screenRoute = "/specialistList";
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
        title: const Text('Specialists'),
      ),
      body: Container(
        height: height,
        width: width,
        child: StreamBuilder(
          stream: SpecialistServices().getSpecialists(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if(snapshot.hasData){
              List specialists = snapshot.data!.docs;
          return ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
    scrollDirection: Axis.vertical,
    itemCount: 5,
    itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(7),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                    ),
                    child: Card(
                      elevation: 5,
                      child: ListTile(
                        tileColor: Colors.transparent,
                        onTap: (){
                          showSpecialistInfo(context,
                            specialty: specialists[index].data()["name"],
                            name: specialists[index].data()["specialty"],
                          );
                        },
                        leading: Image.asset("assets/icons/user_placeholder.png", height: 60,width: 60,),
                        //  child: Image.network(friend['photoUrl'])),
                        title:  Text(specialists[index].data()['name']),

                        subtitle: Container(
                          child:  Text(
                            specialists[index].data()['specialty'],
                            overflow: TextOverflow.ellipsis,
                          ),),
                      ),
                    ),
                  ),
                  const Divider(thickness: 1, indent: 10,endIndent: 10,)
                ],
              );
    }
          );
            }
            return const Center(child: CircularProgressIndicator());
  }
        ),
      ),
    );
  }
 showSpecialistInfo(BuildContext context,{required String name,required String specialty} ) {
   // show the dialog
   showDialog(
     context: context,
     builder: (BuildContext context) {
       return AlertDialog(
         contentPadding: const EdgeInsets.only(top: 0),
         content: Container(
           child: Wrap(
             alignment: WrapAlignment.center,
             children: [
               Container(
                  width: width*0.75,
                 margin: const EdgeInsets.only(left: 10,top: 10,bottom: 10),
                 height: 80,
                 child:  Row(
                   mainAxisAlignment: MainAxisAlignment.start,
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Image.asset("assets/icons/user_placeholder.png", height: 60,width: 60,) ,
                     const SizedBox(width: 10,),
                     Column(
                       mainAxisAlignment: MainAxisAlignment.start,
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children:  [
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
                 padding: const EdgeInsets.symmetric(horizontal: 15),
                 child: const Text(
                   'Gynecologists are medical professionals who specialize in the female '
                       'reproductive system, including the uterus, ovaries, and vagina. '
                       'They provide a wide range of healthcare services, including routine '
                       'check-ups, prenatal care, family planning, and treatment for '
                       'reproductive disorders.',
                   maxLines: 10,
                   overflow: TextOverflow.ellipsis,
                   style: TextStyle(
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
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               GestureDetector(
                 onTap: () {
                 },
                 child: Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 0),
                   child: Container(
                     height: 35,
                     width: width*0.5,
                     decoration: const BoxDecoration(
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
                         SizedBox(
                           width: 10,
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
