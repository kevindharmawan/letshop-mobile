import 'package:flutter/cupertino.dart';

class User {
  String? username;
  String? name;
  String? email;
  String? password;
  String? phoneNumber;
  String? dOB;
  String? profilePicture;
  String? gender;

  User({
    this.username,
    this.name,
    this.email,
    this.password,
    this.phoneNumber,
    this.dOB,
    this.profilePicture,
    this.gender
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json['username'].toString(),
      name: json['name'].toString(),
      email: json['email'].toString(),
      profilePicture: json['profilePicture'].toString(),
    );
  }
}
