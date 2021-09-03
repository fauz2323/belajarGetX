import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:profmoonv2/view/home/homeApp.dart';

class WalletAdressController extends GetxController {
  final storage = new FlutterSecureStorage();
  var addressTron = ''.obs;
  var load = true.obs;

  proses() async {
    addressTron.value = (await storage.read(key: 'tronAdress'))!;
    print("asdasdasd");

    print(addressTron.value);
    load.value = false;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    proses();
  }

  close() {
    Get.offAll(Homes());
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    print("object");
  }
}
