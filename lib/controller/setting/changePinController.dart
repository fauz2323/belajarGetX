import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ChangePinController extends GetxController {
  TextEditingController oldPinController = TextEditingController();
  TextEditingController newPinController = TextEditingController();
  TextEditingController newPinController2 = TextEditingController();
  TextEditingController otpController = TextEditingController();
  var uri2 = Uri.parse('https://profmoon.com/api/changepin');
  var uri = Uri.parse('https://profmoon.com/api/sendotp');
  final storage = new FlutterSecureStorage();
  var keyToken, load = false.obs;
  var secure = true.obs, lock = true;

  send() async {
    keyToken = await storage.read(key: 'key');
    print(keyToken);
    final response = await http.get(uri, headers: {
      'Authorization': 'Bearer $keyToken',
    });
    if (response.statusCode == 200) {
      print("object");
      Get.snackbar("Message", "OTP send");
    }
  }

  proses(var pin, var oldPin, var otp) async {
    Map body = {
      'oldpin': oldPin,
      'otp': otp,
      'newpin': pin,
    };
    final response = await http.post(
      uri2,
      headers: {
        'Authorization': 'Bearer $keyToken',
      },
      body: body,
    );

    final data = json.decode(response.body);
    if (data['status'] == 2) {
      load.value = false;
      Get.back();
    } else if (data['status'] == 1) {
      load.value = false;
      Get.snackbar("Message", "${data['message']}");
    } else if (data['status'] == 0) {
      load.value = false;
      Get.snackbar("Message", "${data['message']}");
    }
  }
}
