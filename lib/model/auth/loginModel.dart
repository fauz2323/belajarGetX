class LoginData {
  LoginData({
    this.token,
    this.dataUser,
    this.key,
    this.tronAdress,
  });

  String? token;
  String? tronAdress;
  String? key;
  DataUser? dataUser;

  factory LoginData.fromJson(Map<String, dynamic> json) => LoginData(
        token: json["token"],
        tronAdress: json['tronAdress'],
        key: json['privateKey'],
        dataUser: DataUser.fromJson(json["data_User"]),
      );
}

class DataUser {
  DataUser({
    this.sessionCookie,
    this.depositAddress,
  });

  String? sessionCookie;
  String? depositAddress;

  factory DataUser.fromJson(Map<String, dynamic> json) => DataUser(
        sessionCookie: json["SessionCookie"],
        depositAddress: json["DepositAddress"],
      );

  Map<String, dynamic> toJson() => {
        "SessionCookie": sessionCookie,
        "DepositAddress": depositAddress,
      };
}
