// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {
  const User({
    required this.id,
    required this.email,
    // required this.name,
    required this.token,
    required this.password,
  });
  final String id;
  final String email;
  // final String name;
  final String token;
  final String password;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      // 'id': id,
      'email': email,
      // 'name': name,
      'token': token,
      'password': password,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['_id'] as String,
      email: map['email'] as String,
      // name: map['name'] as String,
      token: map['token'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source) as Map<String, dynamic>);
}
