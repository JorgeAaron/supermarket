import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  int id;
  String name;
  String lastName;
  String address;
  int celNumber;
  String email;
  String password;

  User(
      {this.id,
      this.name,
      this.lastName,
      this.address,
      this.celNumber,
      this.email,
      this.password});

  factory User.fromJson(Map<dynamic, dynamic> json) => User(
        name: json['name'],
        lastName: json['lastName'],
        address: json['address'],
        celNumber: json['celNumber'],
        email: json['email'],
        password: json['password'],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "lastName": lastName,
        "address": address,
        "celNumber": celNumber,
        "email": email,
        "password": password
      };
}

/* User.fromMap(Map<String, dynamic> map) {
    name = map['name'];
    lastName == map['lastName'];
    address == map['address'];
    celNumber == map['celNumber'];
    email == m=ap['email'];
    password = map['password'];
  } */
