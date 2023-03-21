class Emergency{
  final String name;
  final String content;
  final String? author;

  Emergency( this.author, {
    required this.name,
    required this.content
  });

  factory Emergency.fromJson(Map<String, dynamic> json) {
    return Emergency(
      json['author'],
      name: json['name'],
      content: json['content'],
    );
  }
}

class Facility{
  final String name;
  final List<dynamic> services;
  final String location;
  final String? phonenumber;


  Facility( this.phonenumber, {
    required this.name,
    required this.services,
    required this.location
  });

  factory Facility.fromJson(Map<String, dynamic> json) {
    return Facility(
      json['phonenumber'],
      name: json['name'],
      location: json['location'],
      services: json['services'],
    );
  }
}
