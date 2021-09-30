import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:profmoonv2/controller/betting/martiangleCntroller.dart';
import 'package:profmoonv2/view/betting/betting.dart';
import 'package:profmoonv2/view/betting/formWidget.dart';
import 'package:profmoonv2/view/betting/proses/martiangleProses.dart';
import 'package:profmoonv2/view/betting/widgetBetting/sliderWidgetBetting.dart';

class Martiangle extends StatelessWidget {
  final martiangleController = Get.put(MartiangleController());
  back() {
    Get.off(() => Multiply());
  }

  Martiangle({Key? key}) : super(key: key);

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
          title: Text("MARTINGALE"),
          centerTitle: true,
        ),
        body: Obx(
          () => (martiangleController.load.value)
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
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
                              "Balance : ${martiangleController.balance1} TRON"),
                        ),
                        SizedBox(
                          height: height * 5 / 100,
                        ),
                        FormBetting(
                          controller: martiangleController.startController,
                          name: "Start Bet",
                        ),
                        Obx(
                          () => Text(
                              "Probability = ${martiangleController.slideValue.value.toStringAsFixed(1)}%"),
                        ),
                        SliderBetting(
                          data: (val) {
                            martiangleController.slideValue.value = val;
                          },
                          min: 10,
                          max: 90,
                          value: martiangleController.slideValue.value,
                        ),
                        Text("If Win"),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Checkbox(
                              value: martiangleController.checkbox.value,
                              onChanged: (bool? val) {
                                martiangleController.checkbox.value = val!;
                                print(martiangleController.checkbox.value);
                              },
                            ),
                            Text('Back To Start')
                          ],
                        ),
                        FormBetting(
                          controller: martiangleController.ifloseController,
                          status: true,
                          name: 'If Lose',
                        ),

                        Obx(
                          () => Text(
                              "Target = ${martiangleController.sliderTarget.value.toInt()}%"),
                        ),
                        SliderBetting(
                          data: (val) {
                            martiangleController.sliderTarget.value = val;
                          },
                          min: 1,
                          max: 90,
                          value: martiangleController.sliderTarget.value,
                        ),
                        Obx(
                          () => Text(
                              "Cut Lose = ${martiangleController.sliderLose.value.toInt()}%"),
                        ),
                        SliderBetting(
                          data: (val) {
                            martiangleController.sliderLose.value = val;
                          },
                          min: 1,
                          max: 90,
                          value: martiangleController.sliderLose.value,
                        ),
                        // Slider(
                        //     min: 10,
                        //     max: 90,
                        //     divisions: 100,
                        //     value: martiangleController.slideValue.value,
                        //     onChanged: (double data) {
                        //       martiangleController.slideValue.value = data;
                        //     }),
                        SizedBox(
                          height: 10,
                        ),
                        TextButton(
                          onPressed: () {
                            if (martiangleController.slideValue.value > 95) {
                              Get.snackbar("Message", "Prbability to High");
                            } else {
                              var prob =
                                  (martiangleController.slideValue / 100) *
                                          1000 -
                                      1;
                              var target = martiangleController.balance1 +
                                  (martiangleController.sliderTarget / 100) *
                                      martiangleController.balance1;
                              var loss = martiangleController.balance1 -
                                  (martiangleController.sliderLose / 100) *
                                      martiangleController.balance1;

                              Map argument = {
                                'prob': prob.toInt(),
                                'loss': loss,
                                'target': target,
                                'start':
                                    martiangleController.startController.text,
                                'ifloss':
                                    martiangleController.ifloseController.text,
                                'ifwin': martiangleController.checkbox.value,
                              };
                              Get.off(() => MartiangleProses(),
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
                              "START ROLL",
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
