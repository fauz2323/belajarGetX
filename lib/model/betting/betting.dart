class Betting {
  Betting({
    required this.data,
    required this.ballance,
  });

  Data data;
  Ballance ballance;

  factory Betting.fromJson(Map<String, dynamic> json) => Betting(
        data: Data.fromJson(json["data"]),
        ballance: Ballance.fromJson(json["ballance"]),
      );
}

class Ballance {
  Ballance({
    required this.balance,
  });

  String balance;

  factory Ballance.fromJson(Map<String, dynamic> json) => Ballance(
        balance: json["Balance"],
      );
}

class Data {
  Data({
    required this.message,
    required this.number,
    required this.payOut,
  });

  String message;
  String number;
  double payOut;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        message: json["message"],
        number: json["number"],
        payOut: json["payOut"].toDouble(),
      );
}
