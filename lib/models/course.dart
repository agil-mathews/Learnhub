import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Course {
  final String? name;
  final String? description;
  final String? brief;
  final String? requirements;
  final String? category;
  final int price;
  final String? imagePath;
  final String? videoPath;
  int? Courseid;
  String? userName;
  Course({
    this.name,
    this.description,
    this.brief,
    this.requirements,
    this.category,
    required this.price,
    this.imagePath,
    this.videoPath,
    this.Courseid,
    this.userName,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'description': description,
      'brief': brief,
      'requirements': requirements,
      'category': category,
      'price': price,
      'imagePath': imagePath,
      'videoPath': videoPath,
      'Courseid': Courseid,
      'userName': userName,
    };
  }

  factory Course.fromJson(Map<String, dynamic> json) => Course(
  Courseid: json['Courseid'] as int?, // Use null-aware operator (?)
  name: json['name'] as String?,
  description: json['description'] as String?,
  brief: json['brief'] as String?,
  requirements: json['requirements'] as String?,
  category: json['category']  as String?,
  price: int.parse(json['price'] as String),
  imagePath: json['imagePath']  as String?,
  videoPath: json['videoPath']  as String?,
  userName: json['userName']  as String?,
);

   String toJson() => json.encode(toMap());
   @override
     String toString() {
    return 'Course(Courseid: $Courseid,  name: $name, description: $description, brief: $brief, requirements: $requirements, category: $category, price: $price, imagePath: $imagePath, videoPath: $videoPath, userName: $userName)';
  }

  // factory Course.fromJson(String source) => Course.fromMap(json.decode(source) as Map<String, dynamic>);
}
