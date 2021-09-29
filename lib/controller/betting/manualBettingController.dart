import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';

import 'package:profmoonv2/model/betting/betting.dart';

class ManualBettingController extends GetxController {
  var betting = <Betting>[].obs;
  var sliderValue = 49.99.obs;
  var firstBet = 0.0.obs;
  TextEditingController startController = TextEditingController();
  TextEditingController probController = TextEditingController();
  final storage = new FlutterSecureStorage();
  var token;
  var loading = false.obs;
  var balance = ''.obs;

  init() async {
    token = await storage.read(key: 'key');
  }

  proses(var start, var high) async {
    var uri = Uri.parse("https://profmoon.com/api/dice");
    Map body2 = {
      'pay': start,
      'high': '$high',
      'low': '0',
    };
    final response2 = await http.post(uri, body: body2, headers: {
      'Authorization': 'Bearer $token',
    });

    if (response2.statusCode == 200) {
      final dataJson = json.decode(response2.body);
      if (dataJson['result']['message'] == 'incuifment ballance') {
        Get.snackbar("Error", 'incuifment ballance');
      } else {
        if (dataJson['result']['message'] == 'lose') {
          dataJson['warna'] = Colors.red;
        } else {
          dataJson['warna'] = Colors.black;
        }
        balance.value = dataJson['ballance']['Balance'];
        betting.add(Betting.fromJson(dataJson));
      }
    } else {
      Get.snackbar("Message", "Connection Error");
    }
    loading.value = false;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    init();
    probController.text = '49.99';
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    probController.dispose();
  }
}
