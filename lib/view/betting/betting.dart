import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profmoonv2/controller/betting/multiplyController.dart';
import 'package:profmoonv2/view/betting/dalembert.dart';
import 'package:profmoonv2/view/betting/fibonacci.dart';
import 'package:profmoonv2/view/betting/labuchere.dart';
import 'package:profmoonv2/view/betting/martiangle.dart';
import 'package:profmoonv2/view/widget/multiplyMenu.dart';

class Multiply extends StatelessWidget {
  final multiplyController = Get.put(MultiplyController());
  Multiply({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Multiply"),
          centerTitle: true,
        ),
        body: Obx(
          () => (multiplyController.load.value)
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : WillPopScope(
                  // ignore: missing_return
                  onWillPop: () {
                    return multiplyController.back();
                  },
                  child: Container(
                      child: GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio: 1,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    children: <Widget>[
                      BetMenu(
                        text: "MARTINGALE",
                        icon: Icons.ac_unit,
                        click: (multiplyController.gameStatus.value)
                            ? () {
                                multiplyController.status();
                              }
                            : () {
                                Get.to(() => Martiangle());
                              },
                      ),
                      BetMenu(
                        text: "D'ALEMBERT",
                        icon: Icons.data_usage,
                        click: (multiplyController.gameStatus.value)
                            ? () {
                                multiplyController.status();
                              }
                            : () {
                                Get.to(() => Dalembert());
                              },
                      ),
                      BetMenu(
                        text: "FIBBONACI",
                        click: (multiplyController.gameStatus.value)
                            ? () {
                                multiplyController.status();
                              }
                            : () {
                                Get.to(() => Fibonacci());
                              },
                        icon: Icons.update,
                      ),
                      BetMenu(
                        text: "LABOUCHERE",
                        click: (multiplyController.gameStatus.value)
                            ? () {
                                multiplyController.status();
                              }
                            : () {
                                Get.to(() => Labouchere());
                              },
                        icon: Icons.access_alarm,
                      ),
                    ],
                  )),
                ),
        ),
      ),
    );
  }
}
