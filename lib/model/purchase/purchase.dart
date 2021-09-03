class Purchasecost {
  Purchasecost({
    required this.walletAdress,
    required this.cost,
  });

  String walletAdress;
  String cost;

  factory Purchasecost.fromJson(Map<String, dynamic> json) => Purchasecost(
        walletAdress: json["walletAdress"],
        cost: json["cost"],
      );
}
