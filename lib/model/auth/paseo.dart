class Paseo {
  Paseo({
    this.data,
  });

  Datapaseo? data;

  factory Paseo.fromJson(Map<String, dynamic> json) => Paseo(
        data: Datapaseo.fromJson(json["data"]),
      );
}

class Datapaseo {
  Datapaseo({
    this.trxbalance,
    this.trc20Assets,
  });

  int? trxbalance;
  List<Trc20Asset>? trc20Assets;

  factory Datapaseo.fromJson(Map<String, dynamic> json) => Datapaseo(
        trxbalance: json["trxbalance"],
        trc20Assets: List<Trc20Asset>.from(
            json["trc20Assets"].map((x) => Trc20Asset.fromJson(x))),
      );
}

class Trc20Asset {
  Trc20Asset({
    this.tng5J6Ihg3EskS6PvtefXnbcCd2FZipPe6,
  });

  String? tng5J6Ihg3EskS6PvtefXnbcCd2FZipPe6;

  factory Trc20Asset.fromJson(Map<String, dynamic> json) => Trc20Asset(
        tng5J6Ihg3EskS6PvtefXnbcCd2FZipPe6:
            json["TNG5j6ihg3EskS6PvtefXnbcCd2fZipPE6"],
      );
}
