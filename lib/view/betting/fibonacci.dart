import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:profmoonv2/controller/betting/fibbonacciCOntroller.dart';
import 'package:profmoonv2/view/betting/formWidget.dart';
import 'package:profmoonv2/view/betting/proses/fibonacciProsesController.dart';
import 'package:profmoonv2/view/betting/widgetBetting/sliderWidgetBetting.dart';

import 'betting.dart';

class Fibonacci extends StatelessWidget {
  final FibbonacciController fibbonacciController =
      Get.put(FibbonacciController());
  back() {
    Get.off(() => Multiply());
  }

  Fibonacci({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () {
        return back();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text("FIBONACCI"),
        ),
        body: Obx(
          () => (fibbonacciController.load.value)
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              border: Border.all(
                                color: Colors.blue,
                              )),
                          child: Text(
                              "Balance : ${fibbonacciController.balance1}"),
                        ),
                        SizedBox(
                          height: height * 5 / 100,
                        ),
                        FormBetting(
                          controller: fibbonacciController.startController,
                          name: "Start Bet",
                        ),
                        Obx(
                          () => Text(
                              "Probability = ${fibbonacciController.slideValue.value}%"),
                        ),
                        SliderBetting(
                          data: (val) {
                            fibbonacciController.slideValue.value = val;
                          },
                          min: 10,
                          max: 90,
                          value: fibbonacciController.slideValue.value,
                        ),
                        FormBetting(
                          controller: fibbonacciController.ifWinController,
                          name: "If Win (Increase)",
                          status: true,
                        ),
                        FormBetting(
                          controller: fibbonacciController.ifLoseController,
                          name: "If Lose (Decrease)",
                          status: true,
                        ),
                        Obx(
                          () => Text(
                              "Target = ${fibbonacciController.sliderTarget.value}%"),
                        ),
                        SliderBetting(
                          data: (val) {
                            fibbonacciController.sliderTarget.value = val;
                          },
                          min: 1,
                          max: 90,
                          value: fibbonacciController.sliderTarget.value,
                        ),
                        Obx(
                          () => Text(
                              "Cut Lose = ${fibbonacciController.sliderLose.value}%"),
                        ),
                        SliderBetting(
                          data: (val) {
                            fibbonacciController.sliderLose.value = val;
                          },
                          min: 1,
                          max: 90,
                          value: fibbonacciController.sliderLose.value,
                        ),
                        TextButton(
                          onPressed: () {
                            if (fibbonacciController.slideValue > 95) {
                              Get.snackbar("Message", "Prbability to High");
                            } else {
                              var prob = (fibbonacciController.slideValue /
                                      100 *
                                      1000) -
                                  1;
                              var target = fibbonacciController.balance1 +
                                  ((fibbonacciController.sliderTarget / 100) *
                                      fibbonacciController.balance1);
                              var loss = fibbonacciController.balance1 -
                                  ((fibbonacciController.sliderLose / 100) *
                                      fibbonacciController.balance1);

                              Map argument = {
                                'prob': prob.toInt(),
                                'loss': loss,
                                'target': target,
                                'start':
                                    fibbonacciController.startController.text,
                                'ifWin':
                                    fibbonacciController.ifWinController.text,
                                'iflose':
                                    fibbonacciController.ifLoseController.text
                              };
                              Get.off(() => FibonacciProses(),
                                  arguments: argument);
                              // print(argument);
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6)),
                              color: Colors.blue,
                            ),
                            padding: EdgeInsets.all(10),
                            child: Text(
                              "SUBMIT",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
