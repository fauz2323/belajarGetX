import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TronController extends GetxController {
  final storage = new FlutterSecureStorage();
  var addressTron, token, jsondata;
  var loading = true.obs;
  var isLoading = true.obs;

  load() async {
    addressTron = await storage.read(key: 'tronAdress');
    loading.value = false;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    load();
  }
}
