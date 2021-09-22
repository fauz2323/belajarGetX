class Betting {
  Betting({
    required this.result,
    required this.ballance,
  });

  Result result;
  Ballance ballance;

  factory Betting.fromJson(Map<String, dynamic> json) => Betting(
        result: Result.fromJson(json["result"]),
        ballance: Ballance.fromJson(json["ballance"]),
      );

  Map<String, dynamic> toJson() => {
        "result": result.toJson(),
        "ballance": ballance.toJson(),
      };
}

class Ballance {
  Ballance({
    required this.balance,
  });

  String balance;

  factory Ballance.fromJson(Map<String, dynamic> json) => Ballance(
        balance: json["Balance"],
      );

  Map<String, dynamic> toJson() => {
        "Balance": balance,
      };
}

class Result {
  Result({
    required this.message,
    required this.number,
    required this.payOut,
  });

  String message;
  String number;
  double payOut;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        message: json["message"],
        number: json["number"],
        payOut: json["payOut"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "number": number,
        "payOut": payOut,
      };
}
