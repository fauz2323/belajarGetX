import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:package_info/package_info.dart';
import 'package:http/http.dart' as http;
import 'package:profmoonv2/model/auth/loginModel.dart';
import 'package:profmoonv2/view/auth/verif.dart';
import 'package:profmoonv2/view/home/homeApp.dart';

class LoginController extends GetxController {
  var lock = true.obs;
  var load = true.obs;
  var press = true.obs;
  LoginData? data;
  var secure = true.obs;
  var version = ''.obs;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  _init() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    version.value = packageInfo.version;
    load = false.obs;
  }

  login(String username, String pass) async {
    load.value = true;
    final uri = Uri.parse("https://profmoon.com/api/login");
    final storage = new FlutterSecureStorage();

    Map body = {
      'username': username,
      'password': pass,
    };
    var jsonvar;
    print("masuk sini");
    final response = await http.post(uri, body: body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      data = LoginData.fromJson(json.decode(response.body));
      jsonvar = json.decode(response.body);
      // sharedPreferences.setString('token', jsonvar['token']);
      final box = GetStorage();
      box.write('key', data?.token);

      await storage.write(key: "key", value: data?.token);
      await storage.write(key: 'tronAdress', value: data?.tronAdress);
      await storage.write(key: 'privatkey', value: data?.key);

      load.value = false;
      Get.off(Homes());
    } else if (response.statusCode == 301) {
      Get.off(VerifPage());
    } else if (response.statusCode == 401) {
      load.value = false;
      print("gjhkbjnlk");
      Get.snackbar(
        "Message : ",
        "Wrong Username/Password",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.white,
      );
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _init();
  }
}
