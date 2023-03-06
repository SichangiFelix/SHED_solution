import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../data/models/article.dart';
import '../data/services/articles_services.dart';


class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: const Center(
        child: Text("Home Page"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          logout();
        },
        backgroundColor: Colors.green,
        child: const Text("Click"),
      )
    );
  }

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }

  void loadArticles() async{
    List<Article> articles = await ArticlesServices().getArticles();

    for(var article in articles){
      print(article.title);
      print(article.description);}

  }

}