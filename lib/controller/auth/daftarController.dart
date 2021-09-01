import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:profmoonv2/view/auth/verif.dart';

class DaftarController extends GetxController {
  var token;
  var lock = true.obs,
      lock2 = true.obs,
      lock3 = true.obs,
      lock4 = true.obs,
      load = false.obs;

  String error = "";

  final TextEditingController reffController = TextEditingController();
  final TextEditingController password2Controller = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController pin2Controller = TextEditingController();
  final TextEditingController pinController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  daftar(String email, String username, String pass, var pin, var reff) async {
    print("1");
    final uri = Uri.parse("https://profmoon.com/api/daftar");
    final storage = new FlutterSecureStorage();

    Map body = {
      'email': email,
      'username': username,
      'password': pass,
      'pin': pin,
      'reff': reff,
    };
    final response = await http.post(uri, body: body);
    print(json.decode(response.body));
    final data = json.decode(response.body);
    if (response.statusCode == 200) {
      if (data['message'] == 202) {
        load.value = false;

        Get.snackbar("error", "Username Has Been Used");
      } else if (data['message'] == 201) {
        load.value = false;

        Get.snackbar("error", "Email Has Been Used");
      } else if (data['message'] == 204) {
        load.value = false;

        Get.snackbar("error", "Refferal Not Found");
      } else {
        load.value = false;

        Get.off(VerifPage());
      }
      // var jsonvar = json.decode(response.body);
      // await storage.write(key: "key", value: jsonvar['token']);
      // await storage.write(key: "tronAdress", value: jsonvar['tronAdress']);
      // await storage.write(key: "privatkey", value: jsonvar['privateKey']);
      // await storage.write(key: "data", value: jsonvar["SessionCookie"]);
      print("2");
    }
  }
}
