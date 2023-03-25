import 'package:cloud_firestore/cloud_firestore.dart';

import 'db_service.dart';

class ArticlesServices {

  // Get all articles
  final CollectionReference articlesCollection = db.collection('articles');

  Stream<QuerySnapshot> getArticles() {
    return articlesCollection.snapshots();
  }

  //Search article by name
  Stream<QuerySnapshot> searchArticleByName(String name) {
    return articlesCollection.where('title', isEqualTo: name).snapshots();
  }
}