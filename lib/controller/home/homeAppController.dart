import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:profmoonv2/model/auth/paseo.dart';
import 'package:profmoonv2/model/auth/user.dart';
import 'package:profmoonv2/view/auth/login.dart';

class HomeAppController extends GetxController {
  var tronBalance = ''.obs;
  var token;
  var tronAdress;
  var privatKey;
  late Timer time;
  var paseoBalance = ''.obs;
  String text = "isi";
  var status;
  // Data data = [];
  Data? data;
  // var data = <Data>[].obs;
  var load = true.obs;
  final storage = new FlutterSecureStorage();
  // Data _data2;
  Paseo? getBalance;
  Timer? _timer;
  var url = Uri.parse("https://profmoon.com/api/authtest");
  var uri3 = Uri.parse('https://paseo.live/paseo/CekSaldo');
  var uri2 = Uri.parse('https://profmoon.com/api/getBalance');

  init() async {
    token = await storage.read(key: 'key');
    tronAdress = await storage.read(key: 'tronAdress');
    privatKey = await storage.read(key: 'privatkey');

    final response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    print("object");
    print(response.statusCode);
    if (response.statusCode == 200) {
      // // final response3 = await http.post(
      // //   uri3,
      // //   body: {
      // //     'walletAddress': tronAdress,
      // //   },
      // // );
      // // print("setelah ke await ke1");
      // // print(json.decode(response3.body));

      // // var jsondataPaseo = json.decode(response3.body);
      // // if (jsondataPaseo['data']['trxbalance'] == null) {
      // //   tronBalance.value = "not active";
      // //   paseoBalance.value = "not active";
      // // } else {
      // //   getBalance = Paseo.fromJson(jsondataPaseo);
      // //   var balance = getBalance!.data!.trxbalance! / 1000000;
      // //   tronBalance.value = balance.toString();

      // //   if (jsondataPaseo['data']['trc20Assets'].length != 0) {
      // //     var balanceP = int.parse(getBalance!
      // //             .data!.trc20Assets![0].tng5J6Ihg3EskS6PvtefXnbcCd2FZipPe6!) /
      // //         100000000;
      // //     paseoBalance.value = balanceP.toString();
      // //   } else {
      // //     paseoBalance.value = "Not Active";
      // //   }
      // // }
      // // // data.add(json.decode(response.body));
      data = Data.fromJson(json.decode(response.body));
      // data.add(json.decode(response.body));
      final response2 = await http.get(
        uri2,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      print(response2.statusCode);
      tronBalance.value = json.decode(response2.body)['Balance'];
      load.value = false;
    } else {
      await storage.deleteAll();
      Get.off(Login());
    }

    // time = Timer.periodic(Duration(seconds: 3), (timer) async {
    //   print(11231);
    //   // var uri2 = Uri.parse('https://paseo.live/paseo/CekSaldo');
    //   // Map body = {
    //   //   'walletAddress': tronAdress,
    //   // };

    //   // final response1 = await http.post(uri2, body: body);
    //   // final dataJson = json.decode(response1.body);
    //   // if (dataJson['data']['trxbalance'] != null ||
    //   //     dataJson['data']['trxbalance'] != 0) {}
    // });
  }

  check() async {}

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
    print("Close OBJJS");
    // time.cancel();
  }
}
