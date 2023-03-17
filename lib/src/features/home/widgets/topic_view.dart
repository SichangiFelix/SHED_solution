import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class TopicView extends StatefulWidget {
  const TopicView({Key? key}) : super(key: key);

  @override
  State<TopicView> createState() => _TopicViewState();
}

class _TopicViewState extends State<TopicView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20,right: 20,top: 20),
      height: MediaQuery.of(context).size.height *0.24,
      child: Center(
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 300,
                childAspectRatio: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10),
            itemCount: 4,
            itemBuilder: (BuildContext ctx, index) {
              return Stack(
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    color: Colors.grey,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: GestureDetector(
                        onTap: (){

                        },
                        child: CachedNetworkImage(
                          imageUrl: '',
                          imageBuilder: (context, imageProvider) => Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,

                              ),
                            ),
                          ),
                          placeholder: (context, url) => Container(
                            color: Colors.grey,
                          ),
                          errorWidget: (context, url, error) => Icon(Icons.error),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
