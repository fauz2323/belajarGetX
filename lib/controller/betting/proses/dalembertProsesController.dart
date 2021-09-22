import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:profmoonv2/model/betting/betting.dart';
import 'package:profmoonv2/model/graph/graph.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DalembertProsesController extends GetxController {
  var menang;
  final storage = new FlutterSecureStorage();
  var url = Uri.parse("https://profmoon.com/api/authtest");

  var token;
  var balance1 = 0.0.obs;
  var stop = true.obs, load = true.obs;
  var graph = <Grafik>[].obs;
  var betting = <Betting>[].obs;
  var reset = 0.0.obs;
  var profit = 0.0.obs;
  var graphPosition = 0.obs;
  var colorwin = false.obs, message = ''.obs;
  init() async {
    token = await storage.read(key: 'key');
    print("masuk awalan");
    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    print("setelah awalan");
    if (response.statusCode == 200) {
      reset.value = double.parse(Get.arguments['start']);
      do {
        print(stop);
        var uri = Uri.parse("https://profmoon.com/api/dice");
        Map body2 = {
          'pay': '${reset.value}',
          'high': '${Get.arguments['prob']}',
          'low': '0',
        };
        final response2 = await http.post(uri, body: body2, headers: {
          'Authorization': 'Bearer $token',
        });
        print(response2.statusCode);
        if (response2.statusCode == 200) {
          final jsonData = json.decode(response2.body);
          if (jsonData['result']['message'] == 'lose') {
            print(jsonData['result']['message']);
            betting.add(Betting.fromJson(jsonData));
            balance1.value = double.parse(jsonData['ballance']['Balance']);
            colorwin.value = true;
            graphPosition.value++;
            profit.value = profit.value - reset.value;
            reset.value = reset.value + double.parse(Get.arguments['start']);
            stop = stop;
          } else {
            print(jsonData['result']['message']);

            balance1.value = double.parse(jsonData['ballance']['Balance']);
            betting.add(Betting.fromJson(jsonData));
            colorwin.value = false;
            graphPosition.value++;
            profit.value = profit.value + jsonData['result']['payOut'];
            reset.value = reset.value - double.parse(Get.arguments['start']);
            stop = stop;
          }
        }
        print("object setelah betting");
        graph.add(Grafik(graphPosition.value, profit.value));
      } while (balance1.value > Get.arguments['loss'] &&
          Get.arguments['target'] > balance1.value &&
          stop.value);

      print("done");
    } else {
      load.value = false;
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print(Get.arguments);
    init();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    print("closssseee");
  }
}
