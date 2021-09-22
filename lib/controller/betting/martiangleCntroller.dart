import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class MartiangleController extends GetxController {
  final storage = new FlutterSecureStorage();
  var keyToken;
  var balance;
  var balance1;
  var load = true.obs;
  late TextEditingController startController;

  final TextEditingController probController =
      TextEditingController(text: '50');

  final TextEditingController targetController =
      TextEditingController(text: '10');

  final TextEditingController lossController =
      TextEditingController(text: '10');

  init() async {
    keyToken = await storage.read(key: 'key');
    var uri = Uri.parse('https://profmoon.com/api/getBalance');
    final response = await http.get(uri, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $keyToken',
    });
    print(response.statusCode);
    var jsonz = json.decode(response.body);
    balance = double.parse(jsonz['Balance']) * 1 / 100;
    balance1 = double.parse(jsonz['Balance']);
    startController = TextEditingController(text: balance.toStringAsFixed(8));
    load.value = false;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print("object");
    init();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    print("object");
  }
}
