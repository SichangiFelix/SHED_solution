class Article{
  final String topic;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String content;
  final String? author;

  Article(this.author, {
    required this.topic,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.content,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      json['author'],
      topic: json['topic'],
      title: json['title'],
      description: json['description'],
      url: json['url'],
      urlToImage: json['urlToImage'],
      content: json['content'],
    );
  }
}