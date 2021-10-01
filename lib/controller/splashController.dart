import 'dart:async';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:package_info/package_info.dart';
import 'package:profmoonv2/view/auth/login.dart';
import 'package:profmoonv2/view/home/homeApp.dart';
import 'package:profmoonv2/view/update/updateversion.dart';

class SplashController extends GetxController {
  var versionstatus = true;
  var status = false;
  final storage = FlutterSecureStorage();
  final uri = Uri.parse("https://profmoon.com/api/verCheck");

  init() async {
    var duration = Duration(seconds: 4);
    return Timer(duration, () async {
      PackageInfo packageInfo = await PackageInfo.fromPlatform();
      String version = packageInfo.version;
      final res = await http.get(uri);
      var a = await storage.read(key: 'key');
      print(a);
      final data = json.decode(res.body);
      print("res : $a");
      print(version);

      if (version.toString() == data['version']) {
        if (a == null) {
          print("1");
          Get.off(() => Login(
                version: version,
              ));
        } else {
          print('2');
          Get.off(() => Homes());
        }
      } else {
        print('3');
        Get.off(() => UpdateVersion());
      }
      //
    });
  }

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
    print('splashClose');
  }
}
