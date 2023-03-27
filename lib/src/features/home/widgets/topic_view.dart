import 'package:flutter/material.dart';
import 'package:project/src/features/data/models/article.dart';
import 'package:project/src/features/data/services/articles_services.dart';
import 'package:project/src/features/topics/screens/topics_screen.dart';
import 'package:project/src/features/topics/screens/topic_content_screen.dart';

class TopicView extends StatefulWidget {
  String title;
   TopicView({required this.title});

  @override
  State<TopicView> createState() => _TopicViewState();
}

class _TopicViewState extends State<TopicView> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;


    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.title,
                style: const TextStyle(
                     fontSize: 16, fontWeight: FontWeight.bold),
              ),InkWell(
                onTap: (){
                  Navigator.pushNamed(context, TopicsScreen.screenRoute);
                },
                child: const Text(
                  "Explore More",
                  style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 20,right: 20),
          height: MediaQuery.of(context).size.height *0.35,
          child: StreamBuilder(
            stream: ArticlesServices().getArticles(),
            builder: (context, snapshot) {
              if(snapshot.hasData){
                List articles = snapshot.data!.docs;
                return Center(
                  child: GridView(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth/16),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1.2,
                        crossAxisSpacing: screenWidth/10,
                        mainAxisSpacing: 10),
                    children: [
                      Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              //color: Color(0xff06B782),
                              gradient: const LinearGradient(
                                colors: [
                                  Color(0xff13DEA0),
                                  Color(0xff06B782),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                            ),
                          ),
                          const Align(
                            alignment: Alignment.bottomCenter,
                            child: Image(
                              image: AssetImage("assets/images/curve1.png"),
                            ),
                          ),const Align(
                            alignment: Alignment.bottomCenter,
                            child: Image(
                              image: AssetImage("assets/images/curve 2.png"),
                            ),
                          ),
                          Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: InkWell(
                                onTap: (){
                                  Navigator.pushNamed(context, TopicContent.screenRoute,arguments: Article(articles[0].data()["author"],
                                  topic: articles[0].data()["topic"],
                                  title: articles[0].data()["title"],
                                  description: articles[0].data()["description"],
                                  url: articles[0].data()["url"],
                                  urlToImage: articles[0].data()["urlToImage"],
                                  content: articles[0].data()["content"]));
                                },
                                child: Center(
                                    child: Text(articles[0].data()["title"])
                                ),
                              )
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              //color: Color(0xff06B782),
                              gradient: const LinearGradient(
                                colors: [
                                  Color(0xffFC67A7),
                                  Color(0xffF6815B),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                            ),
                          ),
                          const Align(
                            alignment: Alignment.bottomCenter,
                            child: Image(
                              image: AssetImage("assets/images/curve1.png"),
                            ),
                          ),const Align(
                            alignment: Alignment.bottomCenter,
                            child: Image(
                              image: AssetImage("assets/images/curve 2.png"),
                            ),
                          ),
                          Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: InkWell(
                                onTap: (){
                                  Navigator.pushNamed(context, TopicContent.screenRoute,arguments: Article(
                                      articles[1].data()["author"],
                                      topic: articles[1].data()["topic"],
                                      title: articles[1].data()["title"],
                                      description: articles[1].data()["description"],
                                      url: articles[1].data()["url"],
                                      urlToImage: articles[1].data()["urlToImage"],
                                      content: articles[1].data()["content"]));
                                },
                                child: Center(
                                    child: Text(articles[1].data()["title"])
                                ),
                              )
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              //color: Color(0xff06B782),
                              gradient: const LinearGradient(
                                colors: [
                                  Color(0xff441DFC),
                                  Color(0xff4E81EB),
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                            ),
                          ),
                          const Align(
                            alignment: Alignment.bottomCenter,
                            child: Image(
                              image: AssetImage("assets/images/curve1.png"),
                            ),
                          ),const Align(
                            alignment: Alignment.bottomCenter,
                            child: Image(
                              image: AssetImage("assets/images/curve 2.png"),
                            ),
                          ),
                          Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: InkWell(
                                onTap: (){
                                  Navigator.pushNamed(context, TopicContent.screenRoute,arguments: Article(articles[3].data()["author"],
                                      topic: articles[3].data()["topic"],
                                      title: articles[3].data()["title"],
                                      description: articles[3].data()["description"],
                                      url: articles[3].data()["url"],
                                      urlToImage: articles[3].data()["urlToImage"],
                                      content: articles[3].data()["content"]));
                                },
                                child:  Center(
                                    child: Text(articles[3].data()["title"])
                                ),
                              )
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              //color: Color(0xff06B782),
                              gradient: const LinearGradient(
                                colors: [
                                  Color(0xffFFD541),
                                  Color(0xffF0B31A),
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                            ),
                          ),
                          const Align(
                            alignment: Alignment.bottomCenter,
                            child: Image(
                              image: AssetImage("assets/images/curve1.png"),
                            ),
                          ),const Align(
                            alignment: Alignment.bottomCenter,
                            child: Image(
                              image: AssetImage("assets/images/curve 2.png"),
                            ),
                          ),
                          Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: InkWell(
                                onTap: (){
                                  Navigator.pushNamed(context, TopicContent.screenRoute,arguments: Article(articles[2].data()["author"],
                                      topic: articles[2].data()["topic"],
                                      title: articles[2].data()["title"],
                                      description: articles[2].data()["description"],
                                      url: articles[2].data()["url"],
                                      urlToImage: articles[2].data()["urlToImage"],
                                      content: articles[2].data()["content"]));
                                },
                                child:  Center(
                                    child: Text(articles[2].data()["title"])
                                ),
                              )
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              } else{
                return const Center(child: CircularProgressIndicator());
              }
            } ,
          ),
        ),
      ],
    );
  }
}
