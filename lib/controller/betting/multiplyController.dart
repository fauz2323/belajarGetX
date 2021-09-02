import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:profmoonv2/view/home/homeApp.dart';

class MultiplyController extends GetxController {
  var keyToken;
  var load = true.obs, gameStatus = false.obs;
  final storage = new FlutterSecureStorage();

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

  status() {
    Get.snackbar("Message", "To many Try");
  }

  back() {
    Get.off(Homes());
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    check();
  }
}
