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
  var tronBalance = ''.obs;

  var controller = PageController().obs;
  final storage = new FlutterSecureStorage();
  var load = true.obs;
  var balance = ''.obs;
  var tronAdress;
  Data? users;
  var privatKey;
  late Timer time;
  var a;
  var url = Uri.parse("https://profmoon.com/api/authtest");
  var uri3 = Uri.parse('https://paseo.live/paseo/CekSaldo');
  var uri2 = Uri.parse('https://profmoon.com/api/getBalance');

  init() async {
    load.value = true;
    tronAdress = await storage.read(key: 'tronAdress');
    privatKey = await storage.read(key: 'privatkey');
    a = await storage.read(key: 'key');
    var b = await storage.read(key: 'tronAdress');
    final response2 = await http.get(
      uri2,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $a',
      },
    );
    final response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $a',
      },
    );
    print('print masuk homes ${response.body}');
    if (response.statusCode == 200) {
      users = Data.fromJson(json.decode(response.body));
      balance.value = json.decode(response2.body)['Balance'];
    } else {
      print("masuk login");
      await storage.deleteAll();
      Get.off(() => Login());
    }
    // if (response.statusCode == 401) {
    //   print("masuk login");
    //   await storage.deleteAll();
    //   Get.off(() => Login());
    // } else if (response.statusCode == 200) {
    //   // status.value = json.decode(response.body)['status'];
    //   // name.value = json.decode(response.body)['user']['name'];
    //   print(load);
    //   print('1s1s1');
    // }
    load.value = false;

    print(a);
    print(b);
  }

  check() async {
    final response2 = await http.get(
      uri2,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $a',
      },
    );
    print(response2.statusCode);
    print(json.decode(response2.body)['Balance']);
    Map body = {
      'walletAddress': tronAdress,
    };

    print(privatKey);
    if (response2.statusCode == 200) {
      balance.value = json.decode(response2.body)['Balance'];
      final response1 = await http.post(uri3, body: body);
      final dataJson = json.decode(response1.body);
      if (dataJson['data']['trxbalance'] != null) {
        if (dataJson['data']['trxbalance'] > 999999) {
          final amount = dataJson['data']['trxbalance'] / 1000000;
          print(amount);
          var uri = Uri.parse('https://profmoon.com/api/clearBalance');
          Map bodyRes = {
            'pay': '${amount - 0.3}',
          };
          final res = await http.post(uri, body: bodyRes, headers: {
            'Authorization': 'Bearer $a',
          });
          if (res.statusCode == 200) {
            var data = json.decode(res.body);
            balance.value = data['data'].toString();
          }
          print('aa ${res.statusCode}');
        }
      }
    } else {
      storage.deleteAll();
      Get.offAll(() => Login());
    }
  }

  logout() async {
    await storage.delete(key: "key");
    await storage.delete(key: "data");
    await storage.delete(key: 'tronAdress');
    await storage.delete(key: 'privatkey');
    Get.offAll(() => Login());
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
    time = Timer.periodic(Duration(seconds: 20), (timer) => check());
    print("2231123123123");
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    print('closeObjg');
    load.value = false;
    time.cancel();
  }
}
