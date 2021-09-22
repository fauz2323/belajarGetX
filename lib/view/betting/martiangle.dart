import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:profmoonv2/controller/betting/martiangleCntroller.dart';
import 'package:profmoonv2/view/betting/proses/martiangleProses.dart';

class Martiangle extends StatelessWidget {
  final martiangleController = Get.put(MartiangleController());
  Martiangle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("MARTINGALE"),
      ),
      body: SingleChildScrollView(
          child: Obx(
        () => (martiangleController.load.value)
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text("Start bet"),
                    SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: martiangleController.startController,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(),
                        ),
                      ),
                    ),
                    Text("Probability"),
                    TextFormField(
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      keyboardType: TextInputType.number,
                      controller: martiangleController.probController,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(),
                        ),
                      ),
                    ),
                    Text("Target"),
                    TextFormField(
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      controller: martiangleController.targetController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(),
                        ),
                      ),
                    ),
                    Text("Cut Lose"),
                    TextFormField(
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      keyboardType: TextInputType.number,
                      controller: martiangleController.lossController,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextButton(
                      onPressed: () {
                        if (int.parse(
                                martiangleController.probController.text) >
                            95) {
                          Get.snackbar("Message", "Prbability to High");
                        } else {
                          var prob = (int.parse(martiangleController
                                      .probController.text) /
                                  100 *
                                  1000) -
                              1;
                          var target = martiangleController.balance1 +
                              ((int.parse(martiangleController
                                          .targetController.text) /
                                      100) *
                                  martiangleController.balance1);
                          var loss = martiangleController.balance1 -
                              ((int.parse(martiangleController
                                          .targetController.text) /
                                      100) *
                                  martiangleController.balance1);

                          Map argument = {
                            'prob': prob.toInt(),
                            'loss': loss,
                            'target': target,
                            'start': martiangleController.startController.text,
                          };
                          Get.to(() => MartiangleProses(), arguments: argument);
                          // print(argument);
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(6)),
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
      )),
    );
  }
}
