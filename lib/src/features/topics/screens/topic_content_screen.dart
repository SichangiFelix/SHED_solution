import 'package:flutter/material.dart';

import '../../data/models/article.dart';

class TopicContent extends StatefulWidget {
  const TopicContent({Key? key}) : super(key: key);

  static const String screenRoute = "/topicContent";

  @override
  State<TopicContent> createState() => _TopicContentState();
}

class _TopicContentState extends State<TopicContent> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    final Article article = ModalRoute.of(context)!.settings.arguments as Article;

    return Scaffold(

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                SizedBox(
                  height: screenHeight/3.5,
                  width: screenWidth,
                  child: Image.network(article.urlToImage,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  alignment: Alignment.bottomLeft,
                  width: screenWidth,
                  height: screenHeight/3.5,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        end: Alignment.topCenter,
                        begin: Alignment.bottomCenter,
                        colors: [
                          Colors.black,
                          Colors.transparent,
                        ],
                      )
                  ),
                  child:  Text(article.title,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 30,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10,),
            Container(
              height: screenHeight*0.65,
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  Container(
                    margin:const EdgeInsets.only(left: 10,bottom: 5),
                     // padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      child:  Text(article.description,
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      )),
                  Container(
                      margin:const EdgeInsets.only(left: 10,right:10,bottom: 10),
                    // padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      child:  Text(article.content,
                      )),
                ],
              ),
            )
            // Container(
            //    // padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            //     child: Text('Sub Title1',
            //       style: const TextStyle(
            //         fontSize: 18,
            //       ),
            //     )),
            // Container(
            //   // padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            //     child: Text('Contraceptives are an effective way to prevent unwanted pregnancies and sexually transmitted infections. They come in various forms, including pills, patches, condoms, and intrauterine devices (IUDs). Some contraceptives work by preventing ovulation, while others create a barrier that prevents sperm from reaching the egg.The use of contraceptives has numerous benefits, including greater control over reproductive health, the ability to plan pregnancies, and a reduction in the spread of sexually transmitted infections. However, it\'s important to note that contraceptives do not provide 100% protection against pregnancy or sexually transmitted infections.',
            //
            //     )),

          ],
        ),
      ),
    );
  }
}
