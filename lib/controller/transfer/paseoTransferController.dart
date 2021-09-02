import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:profmoonv2/model/auth/paseo.dart';
import 'package:profmoonv2/view/notifScreen/success.dart';

class PaseoTransferController extends GetxController {
  TextEditingController pinController = TextEditingController();
  Rx<TextEditingController> addressController = TextEditingController().obs;
  TextEditingController banyakController = TextEditingController();
  var uri = Uri.parse("https://paseo.live/paseo/SendToken");
  var uri2 = Uri.parse('https://paseo.live/paseo/CekSaldo');
  var uri3 = Uri.parse("https://profmoon.com/api/pin");
  final storage = new FlutterSecureStorage();
  var keyToken;
  var adressTron;
  var balance1;
  late Paseo balance;
  var obscure = true.obs;
  var load = true.obs;
  var privatKey;
  var code = "".obs;

  loading() async {
    adressTron = await storage.read(key: 'tronAdress');
    keyToken = await storage.read(key: 'key');
    Map body = {'walletAddress': adressTron};
    final response = await http.post(uri2, body: body);
    balance = Paseo.fromJson(json.decode(response.body));
    balance1 = int.parse(balance
            .data!.trc20Assets!.last.tng5J6Ihg3EskS6PvtefXnbcCd2FZipPe6!) /
        100000000;

    load.value = false;
  }

  Future scan() async {
    code.value = await FlutterBarcodeScanner.scanBarcode(
        "#009922", "Cancel", true, ScanMode.QR);
    print(code.value);

    if (code.value == '-1') {
      addressController.value = TextEditingController();
    } else {
      addressController.value = TextEditingController(text: code.value);
    }
  }

  proses(var amount, String address, var pin) async {
    privatKey = await storage.read(key: 'privatkey');
    print("Masuk proses");
    Map body = {
      'senderAddress': adressTron,
      'senderPrivateKey': privatKey,
      'receiverAddress': address,
      'amount': amount
    };

    Map body2 = {
      'pin': pin,
    };

    final res = await http.post(uri3, body: body2, headers: {
      'Authorization': 'Bearer $keyToken',
    });

    if (res.statusCode == 200) {
      final response = await http.post(uri, body: body);
      final data = json.decode(response.body);
      print("hasil");
      print(data);
      if (data['success'] != null) {
        Get.off(Success());
      } else {
        load.value = false;
        Get.snackbar("Message", "insufficient balance");
      }
    } else {
      load.value = false;
      Get.snackbar("Message", "Password Transaction Not Match");
    }
  }

  dataCheck(var amount, String address, var pin) {
    print('banyak $amount');
    print('adress $address');
    print('Pin $pin');
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    loading();
  }
}
