import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:profmoonv2/controller/betting/multiplyController.dart';
import 'package:profmoonv2/view/betting/dalembert.dart';
import 'package:profmoonv2/view/betting/fibonacci.dart';
import 'package:profmoonv2/view/betting/labuchere.dart';
import 'package:profmoonv2/view/betting/martiangle.dart';
import 'package:profmoonv2/view/widget/multiplyMenu.dart';

class Multiply extends StatelessWidget {
  final status;
  final multiplyController = Get.put(MultiplyController());
  Multiply({Key? key, required this.status}) : super(key: key);

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
                        icon: FaIcon(
                          FontAwesomeIcons.angleDoubleUp,
                          size: 60,
                        ),
                        click: (multiplyController.gameStatus.value)
                            ? () {
                                multiplyController.status();
                              }
                            : () {
                                Get.off(() => Martiangle(
                                      status: status,
                                    ));
                              },
                      ),
                      BetMenu(
                        text: "D'ALEMBERT",
                        icon: Icon(
                          Icons.data_usage,
                          size: 60,
                        ),
                        click: (multiplyController.gameStatus.value)
                            ? () {
                                multiplyController.status();
                              }
                            : () {
                                Get.off(() => Dalembert(status: status));
                              },
                      ),
                      BetMenu(
                        text: "FIBBONACI",
                        click: (multiplyController.gameStatus.value)
                            ? () {
                                multiplyController.status();
                              }
                            : () {
                                Get.off(() => Fibonacci(status: status));
                              },
                        icon: FaIcon(
                          FontAwesomeIcons.sortNumericUp,
                          size: 60,
                        ),
                      ),
                      BetMenu(
                        text: "LABOUCHERE",
                        click: (multiplyController.gameStatus.value)
                            ? () {
                                multiplyController.status();
                              }
                            : () {
                                Get.off(() => Labouchere(status: status));
                              },
                        icon: Icon(
                          Icons.view_week,
                          size: 60,
                        ),
                      ),
                    ],
                  )),
                ),
        ),
      ),
    );
  }
}
