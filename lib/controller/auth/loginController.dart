import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:package_info/package_info.dart';
import 'package:http/http.dart' as http;
import 'package:profmoonv2/model/auth/loginModel.dart';
import 'package:profmoonv2/view/auth/verif.dart';
import 'package:profmoonv2/view/home/home.dart';
import 'package:profmoonv2/view/home/homeApp.dart';

class LoginController extends GetxController {
  var lock = true.obs;
  var load = false.obs;
  var press = true.obs;
  LoginData? data;
  var secure = true.obs;
  final storage = new FlutterSecureStorage();
  var version = ''.obs;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  _init() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    // version.value = packageInfo.version;
    version.value = (await storage.read(key: 'version'))!;
    load = false.obs;
  }

  login(String username, String pass) async {
    load.value = true;
    print(load.value);
    final uri = Uri.parse("https://profmoon.com/api/login");

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

      await storage.write(key: "key", value: data?.token);
      await storage.write(key: 'tronAdress', value: data?.tronAdress);
      await storage.write(key: 'privatkey', value: data?.key);
      print("Masuk sini part 2");
      load.value = false;
      Get.off(() => Homes());
    } else if (response.statusCode == 301) {
      load.value = false;
      Get.off(() => Home());
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

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    load.value = false;
    print("object close login");
  }
}
