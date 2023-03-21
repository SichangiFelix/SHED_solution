class Specialist{
  final String name;
  final String specialty;
  final String? phonenumber;
  final String? email;
  final String? location;
  final String? image;
  final String? description;


  Specialist( this.phonenumber, {
    required this.name,
    required this.specialty,
    this.email,
    this.location,
    this.image,
    this.description
  });

  factory Specialist.fromJson(Map<String, dynamic> json) {
    return Specialist(
      json['phonenumber'],
      name: json['name'],
      specialty: json['specialty'],
      email: json['email'],
      location: json['location'],
      image: json['image'],
      description: json['description'],
    );
  }
}