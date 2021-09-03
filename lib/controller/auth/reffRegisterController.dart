import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ReffRegisterController extends GetxController {
  var reff = "".obs;
  Rx<TextEditingController> refController = TextEditingController().obs;
  TextEditingController userController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  var url = Uri.parse("https://profmoon.com/api/authtest");
  var uri = Uri.parse('https://profmoon.com/api/daftar');
  var data;
  final storage = new FlutterSecureStorage();
  var token;
  var load = false.obs;

  // ReffRegisterController(this.reff);

  // init() async {
  //   print('response');

  //   token = await storage.read(key: 'key');
  //   final response = await http.get(
  //     url,
  //     headers: {
  //       'Content-Type': 'application/json',
  //       'Accept': 'application/json',
  //       'Authorization': 'Bearer $token',
  //     },
  //   );
  //   print('response');
  //   print(response.body);
  //   var jsnd = json.decode(response.body);
  //   reff = jsnd['user']['name'];
  //   load.value = false;
  // }

  proses(var ress, var email, var user) async {
    Map body = {
      'username': user,
      'email': email,
      'fixreff': ress,
      'a': '200',
    };
    final response = await http.post(uri, body: body);
    data = json.decode(response.body);
    if (data['message'] == 202) {
      load.value = false;
      Get.snackbar("Message", "${data['status']}");
    } else if (data['message'] == 201) {
      load.value = false;
      Get.snackbar("Message", "${data['status']}");
    } else {
      load.value = false;
      Get.snackbar("Message", "${data['status']}");

      Get.back();
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // init();
    // refController.value = TextEditingController(text: '$reff');
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    print("close Object");
  }
}
