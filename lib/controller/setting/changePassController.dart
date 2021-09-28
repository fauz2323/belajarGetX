import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ChangePassController extends GetxController {
  TextEditingController pinController = TextEditingController();
  TextEditingController passwordOldController = TextEditingController();
  TextEditingController passwordNewController = TextEditingController();
  TextEditingController passwordNewController2 = TextEditingController();
  var uri = Uri.parse('https://profmoon.com/api/changepassword');
  final storage = new FlutterSecureStorage();
  var keyToken, load = false.obs;
  var secure = true.obs;

  proses(var oldPass, var newPass, var pin) async {
    //
    keyToken = await storage.read(key: 'key');
    Map body = {
      'pin': pin,
      'password': oldPass,
      'passwordnew': newPass,
    };
    final response = await http.post(
      uri,
      headers: {
        'Authorization': 'Bearer $keyToken',
      },
      body: body,
    );
    final data = json.decode(response.body);
    if (data['status'] == 1) {
      Get.back();
      Get.snackbar("Message", "Success");
    } else if (data['status'] == 2) {
      Get.snackbar("Message", "${data['message']}");
    } else if (data['status'] == 3) {
      Get.snackbar("Message", "${data['message']}");
    }

    load.value = false;
  }

  @override
  void onClose() {
    print("close");
    // TODO: implement onClose
    super.onClose();
    pinController.clear();
    passwordNewController.clear();
    passwordNewController2.clear();
    passwordOldController.clear();
  }
}
