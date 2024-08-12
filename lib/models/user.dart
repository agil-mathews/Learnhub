import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class User {
  // final String id;
  final String? name;
  final String? email;
  final String? phone;
  final String? password;
   String? token;
  final String? type;

  User({
    // required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
    required this.token,
    required this.type,

  });

  get user => null;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      // 'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'password': password,
      'token': token,
      'type': type,

    };
  }

  // factory User.fromMap(Map<String, dynamic> map) {
    
  //   return User(
  //     // id: map['id'] as String,
  //     name: map['name'] as String?,
  //     email: map['email'] as String?,
  //     phone: map['phone'] as String?,
  //     password: map['password'] as String?,
  //     token: map['token'] as String?,
  //     type: map['type'] as String?,
  //   );
  // }
    factory User.fromJson(Map<String, dynamic> json) => User(
  // id: json['id'] as int?, // Use null-aware operator (?)
  name: json['name'] as String?,
  email: json['email'] as String?,
  phone: json['phone'] as String?,
  password: json['password'] as String?,
  token: json['token']  as String?,
  type: json['type'] as String?,
);


  String toJson() => json.encode(toMap());
   @override
     String toString() {
    return 'User(name: $name, email: $email, phone: $phone, password: $password, token: $token, type: $type)';
  }


}
