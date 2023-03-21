import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../topics/screens/topics_screen.dart';
import '../widgets/meeting_view.dart';
import '../widgets/search_bar.dart';
import '../widgets/specialist_view.dart';
import '../widgets/topic_view.dart';
import '../widgets/trending_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _deviceWidth = MediaQuery.of(context).size.width;
    double _deviceHeight = MediaQuery.of(context).size.height;

    return  Scaffold(
      drawer: Drawer(),
      body: CustomScrollView(
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
                              child: Builder(builder: (context){
                                return IconButton(icon: Icon(Icons.menu), onPressed: (){
                                  Scaffold.of(context).openDrawer();
                                },);
                              }, ),
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
            SliverPadding(
              padding: EdgeInsets.only(top: 0),
              sliver: SliverToBoxAdapter(
                child: GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, TopicsScreen.screenRoute);
                  },
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 16, horizontal: (_deviceWidth-_deviceWidth*0.8)/2),
                      child: Hero(
                        tag: "hero_search",
                        child: Container(
                          height: _deviceHeight * 0.05,
                          width: _deviceWidth * 0.8,
                          padding: EdgeInsets.only(left: 20),
                          decoration: BoxDecoration(
                              border: const Border(
                                left: BorderSide(color: Colors.grey,width: 2,),
                                right: BorderSide(color: Colors.grey,width: 2,),
                                top: BorderSide(color: Colors.grey,width: 2,),
                                bottom: BorderSide(color: Colors.grey,width: 2,),
                              ) ,
                              color: Colors.white12,
                              borderRadius: BorderRadius.circular(15.0)),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text("Search Topics")),
                        ),
                      ),
                    )),
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
      ),
    );
   }
}
