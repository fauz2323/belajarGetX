import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:profmoonv2/model/network/network.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkController extends GetxController {
  var uri = Uri.parse('https://profmoon.com/api/network');
  final storage = new FlutterSecureStorage();
  var data = <Networkss>[].obs;
  var keyToken, load = true.obs;
  init() async {
    keyToken = await storage.read(key: 'key');
    final response = await http.get(
      uri,
      headers: {
        'Authorization': 'Bearer $keyToken',
      },
    );

    if (response.statusCode == 200) {
      final data1 = json.decode(response.body);
      print(data);
      for (Map i in data1['data']) {
        data.add(Networkss.fromJson(i));
        // data = Networkss.fromJson(i)
      }
      load.value = false;
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    init();
  }
}
