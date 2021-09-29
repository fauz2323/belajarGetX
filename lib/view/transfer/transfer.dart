import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profmoonv2/view/home/homeApp.dart';
import 'package:profmoonv2/view/transfer/paseoTransfer.dart';
import 'package:profmoonv2/view/transfer/tronTransfer.dart';

class Transfer extends StatelessWidget {
  const Transfer({Key? key}) : super(key: key);

  goto() {
    Get.off(() => Homes());
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: DefaultTabController(
          length: 1,
          child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              bottom: TabBar(
                tabs: [
                  Tab(
                    text: "TRON",
                  ),
                ],
              ),
              title: Text("withdraw"),
              centerTitle: true,
            ),
            body: TabBarView(
              children: [
                TronTransfer(),
              ],
            ),
          ),
        ),
        onWillPop: () {
          return goto();
        });
  }
}
