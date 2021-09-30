class WDHistoryModel {
  WDHistoryModel({
    required this.history,
  });

  List<History> history;

  factory WDHistoryModel.fromJson(Map<String, dynamic> json) => WDHistoryModel(
        history:
            List<History>.from(json["History"].map((x) => History.fromJson(x))),
      );
}

class History {
  History({
    required this.id,
    required this.idAkun,
    required this.wallet,
    required this.total,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String idAkun;
  String wallet;
  String total;
  DateTime createdAt;
  DateTime updatedAt;

  factory History.fromJson(Map<String, dynamic> json) => History(
        id: json["id"],
        idAkun: json["id_akun"],
        wallet: json["wallet"],
        total: json["total"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );
}
