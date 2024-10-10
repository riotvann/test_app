class User {
  int id;
  String firstName;
  String lastName;
  String username;
  String email;
  String gender;
  String pictureURL;
  String phone;
  DateTime birthday;
  String twitterHandle;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.gender,
    required this.pictureURL,
    required this.phone,
    required this.birthday,
    required this.twitterHandle,
  });
}
