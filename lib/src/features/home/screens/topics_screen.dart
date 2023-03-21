import 'package:flutter/material.dart';
import '../widgets/topic_searchbar.dart';
import '../widgets/topics_screen_grid.dart';

class TopicScreen extends StatelessWidget {
  const TopicScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children:const [
            CustomScrollView(
                slivers: [
                  SliverPadding(
                    padding: EdgeInsets.only(top: 0),
                    sliver: SliverToBoxAdapter(
                      child: Center(child: Text('Let\'s learn')),
                    ),
                  ),
                    SliverPadding(
                    padding: EdgeInsets.only(top: 0),
                    sliver: SliverToBoxAdapter(
                      child: TopicSearchBar(),
                    ),
                  ),
                  SliverPadding(
                    padding:  EdgeInsets.only(top: 0),
                    sliver: SliverToBoxAdapter(
                        child: TopicsGrid()
                    ),
                  ),

                ],

            ),
          ],
        ),
      ),
    );
  }
}
