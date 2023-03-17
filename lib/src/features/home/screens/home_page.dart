import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widgets/meeting_view.dart';
import '../widgets/search_bar.dart';
import '../widgets/specialist_view.dart';
import '../widgets/topic_view.dart';
import '../widgets/trending_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  CustomScrollView(
     slivers: [
      const  SliverPadding(
         padding:  EdgeInsets.only(top: 20),
         sliver: SliverToBoxAdapter(
           child: SearchBar(),
         ),
       ),
       SliverPadding(
         padding:  EdgeInsets.only(top: 10),
         sliver: SliverToBoxAdapter(
             child: TrendingView(title: 'Trending',)
         ),
       ),
       SliverPadding(
         padding:  EdgeInsets.only(top: 10),
         sliver: SliverToBoxAdapter(
             child: TopicView(title: 'Health Topics',)
         ),
       ),
       SliverPadding(
         padding:  EdgeInsets.only(top: 10),
         sliver: SliverToBoxAdapter(
           child: SpecialistView(title: 'Specialists',)
         ),
       ),
       SliverPadding(
         padding:  EdgeInsets.only(top: 10),
         sliver: SliverToBoxAdapter(
             child: MeetingView(title: 'Upcoming Meetings',)
         ),
       ),
     ]
    );
   }
}
