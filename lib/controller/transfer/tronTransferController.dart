import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:profmoonv2/model/auth/paseo.dart';
import 'package:profmoonv2/view/notifScreen/success.dart';

class TronsTransferController extends GetxController {
  var uri = Uri.parse("https://paseo.live/paseo/SendTron");
  var uri3 = Uri.parse("https://profmoon.com/api/pin");
  var uri2 = Uri.parse('https://profmoon.com/api/getBalance');
  final storage = new FlutterSecureStorage();
  TextEditingController pinController = TextEditingController();
  Rx<TextEditingController> addressController = TextEditingController().obs;
  TextEditingController banyakController = TextEditingController();
  var keyToken;
  var adressTron;
  late Paseo balance;
  var balance1;
  var load = true.obs;
  var code = "".obs;
  var obsecure = true.obs;
  var privatKey;

  loading() async {
    privatKey = await storage.read(key: 'privatkey');

    adressTron = await storage.read(key: 'tronAdress');
    keyToken = await storage.read(key: 'key');
    final response = await http.get(uri2, headers: {
      'Authorization': 'Bearer $keyToken',
    });

    balance1 = double.parse(json.decode(response.body)['Balance']);

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
