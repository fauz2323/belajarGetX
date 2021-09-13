import 'package:get/get.dart';
import 'package:profmoonv2/model/graph/graph.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

import 'package:syncfusion_flutter_charts/charts.dart';

class FibbonacciProsesController extends GetxController {
  List data = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377];
  var graph = <Grafik>[].obs;
  var balance1 = 0.0.obs;
  var stop = true.obs, load = true.obs;

  init() async {
    var uri = Uri.parse("uri");
    int number = 0;
    int reset;
    int posisi = 1;
    do {
      print("object11");
      Map body2 = {};

      final response2 = await http.post(uri, body: body2);
      var pay = json.decode(response2.body);
      if (pay['PayOut'] == 0) {
        if (number > 9) {
          reset = widget.start * data[number];
          prof = prof - reset;
          posisi++;
        } else {
          number = number + widget.down;
          prof = prof - reset;
          posisi++;

          reset = widget.start * data[number];
        }
      } else {
        if (number == 0) {
          prof = prof + reset;

          posisi++;
          reset = widget.start * data[number];
        } else {
          posisi++;
          number = number - widget.up;
          prof = prof + reset;

          reset = widget.start * data[number];
        }
      }

      print(number);
      graph.add(Grafik(posisi, prof));
      await Future.delayed(Duration(seconds: 1), () async {
        final response3 = await http.post(uri, body: body3);
        balance1 = json.decode(response3.body)['Balance'];
        dataBet.add(Bet.fromJson(pay));
        load.value = false;
      });
    } while (balance1 > widget.loss && widget.target > balance1 && stop);
  }
}
