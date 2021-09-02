class Data {
  Data({
    this.user,
  });

  final User? user;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        user: User.fromJson(json["user"]),
      );
}

class User {
  User({
    this.id,
    this.name,
    this.username,
    required this.email,
    this.joinDate,
  });

  int? id;
  String? name;
  String? username;
  String email;
  String? joinDate;

  factory User.fromJson(Map<String, dynamic> json) => User(
      id: json["id"],
      name: json["name"],
      username: json["username"],
      email: json['email'],
      joinDate: json['joinDate']);
}
