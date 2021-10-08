import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:profmoonv2/controller/betting/labouchereController.dart';
import 'package:profmoonv2/view/betting/betting.dart';
import 'package:profmoonv2/view/betting/formWidget.dart';
import 'package:profmoonv2/view/betting/proses/labouchereProsess.dart';
import 'package:profmoonv2/view/betting/widgetBetting/sliderWidgetBetting.dart';

class Labouchere extends StatelessWidget {
  final status;
  final LabouchereController labouchereController =
      Get.put(LabouchereController());
  Labouchere({Key? key, this.status}) : super(key: key);
  back() {
    Get.off(() => Multiply(
          status: status,
        ));
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () {
        return back();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Labouchere'),
          centerTitle: true,
        ),
        body: Obx(
          () => (labouchereController.load.value)
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
                                "Balance : ${labouchereController.balance1} TRON")),
                        SizedBox(
                          height: height * 5 / 100,
                        ),
                        FormBetting(
                          controller: labouchereController.startController,
                          name: "Start Bet",
                          status: status,
                        ),
                        Obx(
                          () => Text(
                              "Probability = ${labouchereController.slideValue.value.toStringAsFixed(1)}%"),
                        ),
                        SliderBetting(
                          status: status,
                          data: (val) {
                            labouchereController.slideValue.value = val;
                          },
                          min: 10,
                          max: 90,
                          value: labouchereController.slideValue.value,
                        ),
                        Obx(
                          () => Text(
                              "Target = ${labouchereController.targetValue.value.toInt()}%"),
                        ),
                        SliderBetting(
                            status: status,
                            min: 1,
                            max: 90,
                            value: labouchereController.targetValue.value,
                            data: (val) {
                              labouchereController.targetValue.value = val;
                            }),
                        Obx(
                          () => Text(
                              "Cut Lose = ${labouchereController.lossValue.value.toInt()}%"),
                        ),
                        SliderBetting(
                            status: status,
                            min: 1,
                            max: 90,
                            value: labouchereController.lossValue.value,
                            data: (val) {
                              labouchereController.lossValue.value = val;
                            }),
                        SizedBox(
                          height: 10,
                        ),
                        TextButton(
                          onPressed: () {
                            if (int.parse(
                                    labouchereController.probController.text) >
                                95) {
                              Get.snackbar("Message", "Prbability to High");
                            } else {
                              labouchereController.check();
                              var prob = (labouchereController.slideValue /
                                  100 *
                                  1000);
                              var target = labouchereController.balance1 +
                                  ((labouchereController.targetValue / 100) *
                                      labouchereController.balance1);
                              var loss = labouchereController.balance1 -
                                  ((labouchereController.lossValue / 100) *
                                      labouchereController.balance1);

                              Map argument = {
                                'prob': prob.toInt(),
                                'loss': loss,
                                'target': target,
                                'start':
                                    labouchereController.startController.text,
                              };
                              Get.off(
                                  () => LabouchereProses(
                                        status: status,
                                      ),
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
                              "Start Roll",
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
