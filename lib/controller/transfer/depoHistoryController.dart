import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:profmoonv2/model/history/depoHistory.dart';
import 'dart:convert';

class DepoHistoryController extends GetxController {
  var uri = Uri.parse('http://profmoon.com/api/historyDepo');
  var token;
  var load = true.obs;
  var dataList = <HistoryDepo>[].obs;

  final storage = new FlutterSecureStorage();

  initial() async {
    token = await storage.read(key: 'key');
    final response = await http.get(uri, headers: {
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode == 200) {
      dataList.add(HistoryDepo.fromJson(json.decode(response.body)));
    }
    load.value = false;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    initial();
  }
}
