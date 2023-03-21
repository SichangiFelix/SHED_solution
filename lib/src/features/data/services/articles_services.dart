import 'package:project/src/features/data/models/article.dart';

import 'db_service.dart';

class ArticlesServices {

  // Get all articles
  Future<List<Article>> getArticles() async {
    final snapshot = await db.collection('articles').get();
    final articles = snapshot.docs.map((doc) => Article.fromJson(doc.data())).toList();
    return articles;
  }
}