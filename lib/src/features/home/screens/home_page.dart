import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common/statemanager/theme_mode_manager.dart';
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

  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;

    return  Scaffold(
      drawer: SizedBox(
        height: screenHeight,
        width: screenwidth/1.6,
        child: Drawer(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: screenHeight/40, horizontal: screenwidth/40),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Switch app theme",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Switch(
                          value: isDarkMode, onChanged: (newValue){
                        setState(() {
                          isDarkMode = newValue;
                        });
                        Provider.of<ThemeModeManager>(context, listen: false).changeTheme(isDarkMode: newValue);
                      }),
                    ],
                  ),
                  Divider(thickness: 2,),
                  TextButton(onPressed: (){}, child: Text("Logout")),
                  Divider(thickness: 2,),
                ],
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: CustomScrollView(
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
                            margin:const EdgeInsets.only(left:5,right: 4),
                            child:Center(
                                child: Builder(
                                  builder: (context){
                                    return InkWell(
                                        onTap: (){
                                          Scaffold.of(context).openDrawer();
                                        },
                                        child: const Icon(Icons.menu));
                                  },
                                ),
                            )
                        ),
                        Container(
                            margin:const EdgeInsets.only(left:3,right: 4),
                            child:const Center(
                                child:Icon(Icons.notifications)
                            )
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SliverPadding(
                padding: EdgeInsets.only(top: 0),
                sliver: SliverToBoxAdapter(
                  child: SearchBar(),
                ),
              ),
              SliverPadding(
                padding:  const EdgeInsets.only(top: 0),
                sliver: SliverToBoxAdapter(
                    child: TrendingView(title: 'Trending',)
                ),
              ),
              SliverPadding(
                padding:  const EdgeInsets.only(top: 0),
                sliver: SliverToBoxAdapter(
                    child: TopicView(title: 'Health Topics',)
                ),
              ),
              SliverPadding(
                padding:  const EdgeInsets.only(top: 0),
                sliver: SliverToBoxAdapter(
                    child: SpecialistView(title: 'Specialists',)
                ),
              ),
              SliverPadding(
                padding:  const EdgeInsets.only(top: 0),
                sliver: SliverToBoxAdapter(
                    child: MeetingView(title: 'Upcoming Meetings',)
                ),
              ),
            ]
        ),
      ),
    );
   }
}
