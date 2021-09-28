import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:profmoonv2/model/auth/user.dart';
import 'package:profmoonv2/view/auth/login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomesController extends GetxController {
  var selectedNavbar = 0.obs;
  var controller = PageController().obs;
  final storage = new FlutterSecureStorage();
  var load = true.obs;
  var tronAdress;
  var privatKey;
  late Timer time;
  var url = Uri.parse("https://profmoon.com/api/authtest");
  var status = ''.obs;

  init() async {
    tronAdress = await storage.read(key: 'tronAdress');
    privatKey = await storage.read(key: 'privatkey');
    var a = await storage.read(key: 'key');
    var b = await storage.read(key: 'tronAdress');

    final response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $a',
      },
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      status.value = json.decode(response.body)['status'];
    }
    print(a);
    print(b);
  }

  logout() async {
    await storage.delete(key: "key");
    await storage.delete(key: "data");
    await storage.delete(key: 'tronAdress');
    await storage.delete(key: 'privatkey');
    Get.off(Login());
  }

  changeSelectedNumber(int index) {
    selectedNavbar.value = index;
  }

  refreshData() async {}

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    init();
    print("2231123123123");
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    print('closeObjg');
  }
}
