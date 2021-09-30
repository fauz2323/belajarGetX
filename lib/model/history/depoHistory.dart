class HistoryDepo {
  HistoryDepo({
    required this.history,
  });

  List<HistoryElement> history;

  factory HistoryDepo.fromJson(Map<String, dynamic> json) => HistoryDepo(
        history: List<HistoryElement>.from(
            json["History"].map((x) => HistoryElement.fromJson(x))),
      );
}

class HistoryElement {
  HistoryElement({
    required this.id,
    required this.idAkun,
    required this.total,
    required this.wallet,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String idAkun;
  String total;
  String wallet;
  DateTime createdAt;
  DateTime updatedAt;

  factory HistoryElement.fromJson(Map<String, dynamic> json) => HistoryElement(
        id: json["id"],
        idAkun: json["id_akun"],
        total: json["total"],
        wallet: json["wallet"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );
}
