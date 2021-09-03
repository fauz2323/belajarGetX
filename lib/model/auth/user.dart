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
    required this.status,
    this.joinDate,
  });

  int? id;
  String? name;
  String? username;
  String email;
  String? joinDate;
  String status;

  factory User.fromJson(Map<String, dynamic> json) => User(
      id: json["id"],
      name: json["name"],
      username: json["username"],
      email: json['email'],
      status: json['status'],
      joinDate: json['joinDate']);
}
