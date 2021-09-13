class Data {
  Data({
    required this.status,
    this.user,
  });

  final User? user;
  String status;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        status: json['status'],
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
