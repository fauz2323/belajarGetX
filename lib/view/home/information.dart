import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profmoonv2/controller/home/tronController.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Information extends StatelessWidget {
  final infoController = Get.put(TronController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => (infoController.loading.value)
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Stack(
              children: [
                WebView(
                  initialUrl:
                      'https://tronscan.org/#/address/${infoController.addressTron}',
                  javascriptMode: JavascriptMode.unrestricted,
                  onPageFinished: (finish) {
                    infoController.isLoading.value = false;
                  },
                ),
                Obx(
                  () => infoController.isLoading.value
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : Stack(),
                )
              ],
            ),
    );
  }
}
