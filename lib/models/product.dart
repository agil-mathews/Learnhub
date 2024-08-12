// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Product {
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
  Product({
    required this.name,
    required this.description,
    required this.brief,
    required this.requirements,
    required this.category,
    required this.price,
    required this.imagePath,
    required this.videoPath,
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

  factory Product.fromJson(Map<String, dynamic> json) => Product(
  Courseid: json['Courseid'] as int?, // Use null-aware operator (?)
  name: json['name'] as String?,
  description: json['description'] as String?,
  brief: json['brief'] as String?,
  requirements: json['requirements'] as String?,
  category: json['category']  as String?,
  price: json['price'] as int,
  imagePath: json['imagePath']  as String?,
  videoPath: json['videoPath']  as String?,
  // id: json['id']  as String?,
  userName: json['userName']  as String?,
);


  String toJson() => json.encode(toMap());
   @override
     String toString() {
    return 'Product(Courseid: $Courseid, name: $name, description: $description, brief: $brief, requirements: $requirements, category: $category, price: $price, imagePath: $imagePath, videoPath: $videoPath, userName: $userName)';
  }

  // factory Product.fromJson(String source) => Product.fromMap(json.decode(source) as Map<String, dynamic>);
}
