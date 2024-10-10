import 'package:test_app/domain/user.dart';

class UserModel extends User {
  UserModel({
    required super.id,
    required super.firstName,
    required super.lastName,
    required super.username,
    required super.email,
    required super.gender,
    required super.pictureURL,
    required super.phone,
    required super.birthday,
    required super.twitterHandle,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      username: json['username'],
      email: json['email'],
      gender: json['gender'],
      pictureURL: json['pictureURL'],
      phone: json['phone'],
      birthday: DateTime.parse(json['birthday']),
      twitterHandle: json['twitterHandle'],
    );
  }
}
