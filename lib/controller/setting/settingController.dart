import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:profmoonv2/model/auth/user.dart';
import 'dart:convert';

class SettingController extends GetxController {
  final storage = new FlutterSecureStorage();
  var load = true.obs;
  var url = Uri.parse("https://profmoon.com/api/authtest");
  var keyToken;
  late Data data;
  var sendValue = false.obs;
  init() async {
    keyToken = await storage.read(key: 'key');
    final response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $keyToken',
      },
    );
    if (response.statusCode == 200) {
      data = Data.fromJson(json.decode(response.body));
      load.value = false;
    }
  }

  send() async {
    var send = Uri.parse("https://profmoon.com/api/sendpin");

    final response = await http.get(
      send,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $keyToken',
      },
    );
    print(response.statusCode);

    if (response.statusCode == 200) {
      sendValue.value = false;
      Get.snackbar("Message", 'Password Transaction Send');
    } else {
      sendValue.value = false;
      Get.snackbar("Error", 'Check Your Connection');
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    init();
  }
}
