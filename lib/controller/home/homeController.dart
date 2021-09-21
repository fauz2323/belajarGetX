import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_storage/get_storage.dart';
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

  init() async {
    final box = GetStorage();
    tronAdress = await storage.read(key: 'tronAdress');
    privatKey = await storage.read(key: 'privatkey');
    var c = box.read('key');
    var a = await storage.read(key: 'key');
    var b = await storage.read(key: 'tronAdress');
    print(a);
    print(b);
    print("print : ${c}");
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
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    print('closeObjg');
    time.cancel();
  }
}
