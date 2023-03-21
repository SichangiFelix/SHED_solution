import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widgets/meeting_view.dart';
import '../widgets/search_bar.dart';
import '../widgets/specialist_view.dart';
import '../widgets/topic_view.dart';
import '../widgets/trending_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {

    return  CustomScrollView(
     slivers: [
       SliverAppBar(
         automaticallyImplyLeading: false,
         backgroundColor: Colors.white,
         pinned: false,
         expandedHeight: 0,
         flexibleSpace: FlexibleSpaceBar(
           background: SafeArea(
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                Container(
                  margin:EdgeInsets.only(left:5,right: 4),
                  child:Center(
                    child:Icon(Icons.menu)
                  )
                ),
                 Container(
                     margin:EdgeInsets.only(left:3,right: 4),
                     child:Center(
                         child:Icon(Icons.notifications)
                     )
                 ),
               ],
             ),
           ),
         ),
       ),
      const  SliverPadding(
        padding: EdgeInsets.only(top: 0),
         sliver: SliverToBoxAdapter(
           child: SearchBar(),
         ),
       ),
       SliverPadding(
         padding:  EdgeInsets.only(top: 0),
         sliver: SliverToBoxAdapter(
             child: TrendingView(title: 'Trending',)
         ),
       ),
       SliverPadding(
         padding:  EdgeInsets.only(top: 0),
         sliver: SliverToBoxAdapter(
             child: TopicView(title: 'Health Topics',)
         ),
       ),
       SliverPadding(
         padding:  EdgeInsets.only(top: 0),
         sliver: SliverToBoxAdapter(
           child: SpecialistView(title: 'Specialists',)
         ),
       ),
       SliverPadding(
         padding:  EdgeInsets.only(top: 0),
         sliver: SliverToBoxAdapter(
             child: MeetingView(title: 'Upcoming Meetings',)
         ),
       ),
     ]
    );
   }


}
