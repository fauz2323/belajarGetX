class Networkss {
  Networkss({
    required this.username,
    required this.email,
  });

  String username;
  String email;

  factory Networkss.fromJson(Map<dynamic, dynamic> json) => Networkss(
        username: json["username"],
        email: json["email"],
      );
}
