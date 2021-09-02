class LoginData {
  LoginData({
    this.token,
    this.key,
    this.tronAdress,
  });

  String? token;
  String? tronAdress;
  String? key;

  factory LoginData.fromJson(Map<String, dynamic> json) => LoginData(
        token: json["token"],
        tronAdress: json['tronAdress'],
        key: json['privateKey'],
      );
}
