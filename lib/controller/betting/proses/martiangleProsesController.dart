import 'package:get/get.dart';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:profmoonv2/model/graph/graph.dart';
import 'dart:convert';

import 'package:syncfusion_flutter_charts/charts.dart';

class MartiangleProsesCOntroller extends GetxController {
  var menang;
  var balance1 = 0.0.obs;
  var stop = true.obs, load = true.obs;
  var graph = <Grafik>[Grafik(2, 3), Grafik(3, 4), Grafik(4, 5)].obs;
  var reset = 0.obs;
  var profit = 0.obs;
  var graphPosition = 0.obs;
  var colorwin = false.obs, message = ''.obs;
  var start = Get.arguments['start'];
  init() async {
    if (12 < 0) {
      do {
        var uri = Uri.parse("uri");
        Map body2 = {};
        final response2 = await http.post(uri, body: body2);

        if (!menang) {
          colorwin.value = true;
          graphPosition.value++;
          profit.value = profit.value - reset.value;
          reset.value = reset.value * 2;
          stop = stop;
        } else {
          colorwin.value = false;
          graphPosition.value++;
          profit.value = profit.value - reset.value;
          reset.value = reset.value * 2;
          stop = stop;
        }

        graph.add(Grafik(graphPosition.value, profit.value));

        await Future.delayed(Duration(seconds: 1), () async {
          final response3 = await http.post(uri, body: body2);
          load.value = false;
          balance1 = json.decode(response3.body)['balance'];
        });
      } while (balance1 > Get.arguments['loss'] &&
          Get.arguments['target'] > balance1 &&
          stop.value);
    } else {
      load.value = false;
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print(Get.arguments);
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    print("object");
  }
}
