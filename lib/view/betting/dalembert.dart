import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:profmoonv2/controller/betting/dalembertController.dart';
import 'package:profmoonv2/view/betting/betting.dart';
import 'package:profmoonv2/view/betting/formWidget.dart';
import 'package:profmoonv2/view/betting/proses/dalembertProses.dart';
import 'package:profmoonv2/view/betting/widgetBetting/sliderWidgetBetting.dart';

class Dalembert extends StatelessWidget {
  final DalembertController dalembertController =
      Get.put(DalembertController());
  back() {
    Get.off(() => Multiply());
  }

  Dalembert({Key? key}) : super(key: key);

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
          title: Text('D-Alembert'),
          centerTitle: true,
        ),
        body: Obx(
          () => (dalembertController.load.value)
              ? Center(child: CircularProgressIndicator())
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
                          child:
                              Text("Balance : ${dalembertController.balance1}"),
                        ),
                        SizedBox(
                          height: height * 5 / 100,
                        ),
                        FormBetting(
                          controller: dalembertController.startController,
                          name: "Start Bet",
                        ),
                        Obx(
                          () => Text(
                              "Probability = ${dalembertController.sliderValue.value.toStringAsFixed(1)}%"),
                        ),
                        SliderBetting(
                          data: (val) {
                            dalembertController.sliderValue.value = val;
                          },
                          min: 10,
                          max: 90,
                          value: dalembertController.sliderValue.value,
                        ),
                        Obx(
                          () => Text(
                              "Target = ${dalembertController.targetValue.value.toInt()}%"),
                        ),
                        SliderBetting(
                          data: (val) {
                            dalembertController.targetValue.value = val;
                          },
                          min: 1,
                          max: 90,
                          value: dalembertController.targetValue.value,
                        ),
                        Obx(
                          () => Text(
                              "Cut Lose = ${dalembertController.lossValue.value.toInt()}%"),
                        ),
                        SliderBetting(
                          data: (val) {
                            dalembertController.lossValue.value = val;
                          },
                          min: 1,
                          max: 90,
                          value: dalembertController.lossValue.value,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextButton(
                          onPressed: () {
                            if (int.parse(
                                    dalembertController.probController.text) >
                                95) {
                              Get.snackbar("Message", "Prbability to High");
                            } else {
                              var prob =
                                  (dalembertController.sliderValue.value /
                                          100 *
                                          1000) -
                                      1;
                              var target = dalembertController.balance1 +
                                  ((dalembertController.targetValue.value /
                                          100) *
                                      dalembertController.balance1);
                              var loss = dalembertController.balance1 -
                                  ((dalembertController.lossValue.value / 100) *
                                      dalembertController.balance1);

                              Map argument = {
                                'prob': prob.toInt(),
                                'loss': loss,
                                'target': target,
                                'start':
                                    dalembertController.startController.text,
                              };
                              Get.off(() => DalembertProses(),
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
