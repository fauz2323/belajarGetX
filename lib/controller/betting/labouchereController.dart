import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';

class LabouchereController extends GetxController {
  final storage = new FlutterSecureStorage();
  var keyToken;
  var balance1;
  var slideValue = 49.9.obs, lossValue = 20.0.obs, targetValue = 1.0.obs;
  var balance;
  var gameStatus = false.obs;
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
    balance = double.parse(jsonz['Balance']) * 1 / 1000;
    balance1 = double.parse(jsonz['Balance']);
    startController = TextEditingController(text: balance.toStringAsFixed(6));
    load.value = false;
  }

  check() async {
    keyToken = await storage.read(key: "key");
    final response = await http.get(
      Uri.parse('https://profmoon.com/api/checkgame'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $keyToken',
      },
    );
    final stat = jsonDecode(response.body);
    if (response.statusCode == 201) {
      gameStatus.value = true;
    } else {
      gameStatus.value = false;
    }

    print(gameStatus);
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
