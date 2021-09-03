import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:profmoonv2/model/auth/paseo.dart';
import 'dart:convert';

import 'package:profmoonv2/model/purchase/purchase.dart';

class PurchaseController extends GetxController {
  final storage = new FlutterSecureStorage();
  var keyToken, tronAdress, privatKey;
  late Purchasecost purchase;
  var load = true.obs;
  var uri2 = Uri.parse("https://paseo.live/paseo/SendToken");
  var uri = Uri.parse("https://profmoon.com/api/cost");
  Paseo? getBalance;
  var uri3 = Uri.parse("https://paseo.live/paseo/CekSaldo");
  var paseoBalance = ''.obs;
  var tronBalance = ''.obs;
  var cost = ''.obs;
  var onn = false.obs;

  init() async {
    tronAdress = await storage.read(key: 'tronAdress');
    privatKey = await storage.read(key: 'privatkey');
    keyToken = await storage.read(key: 'key');
    print("object");
    final response = await http.get(
      uri,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $keyToken',
      },
    );
    print(response.body);
    final response3 = await http.post(
      uri3,
      body: {
        'walletAddress': tronAdress,
      },
    );
    var costdata = json.decode(response.body);
    var jsondataPaseo = json.decode(response3.body);
    if (jsondataPaseo['data']['trxbalance'] == null) {
      tronBalance.value = "not active";
      paseoBalance.value = "not active";
    } else {
      getBalance = Paseo.fromJson(jsondataPaseo);
      var balance = getBalance!.data!.trxbalance! / 1000000;
      tronBalance.value = balance.toString();

      if (jsondataPaseo['data']['trc20Assets'].length != 0) {
        var balanceP = int.parse(getBalance!
                .data!.trc20Assets![0].tng5J6Ihg3EskS6PvtefXnbcCd2FZipPe6!) /
            100000000;
        paseoBalance.value = balanceP.toString();
        var balancePas = int.parse(costdata['cost']) / 100000000;
        cost.value = balancePas.toString();
      } else {
        paseoBalance.value = "Not Active";
      }
    }

    print(response.statusCode);
    if (response.statusCode == 200) {
      purchase = Purchasecost.fromJson(json.decode(response.body));
    }

    if (double.parse(tronBalance.value) < 6 &&
        double.parse(paseoBalance.value) < int.parse(purchase.cost)) {
      onn.value = true;
    } else {
      onn.value = false;
    }

    load.value = false;
    print(tronBalance);
  }

  proses() async {
    Map body = {
      'senderAddress': tronAdress,
      'senderPrivateKey': privatKey,
      'receiverAddress': purchase.walletAdress,
      'tokenAmount': purchase.cost,
    };
    print(tronAdress);
    print(privatKey);
    print(purchase.walletAdress);
    print(purchase.cost);

    final response = await http.post(uri2, body: body);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    init();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    print("close Object");
  }
}
