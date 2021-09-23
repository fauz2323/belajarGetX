import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:profmoonv2/controller/betting/labouchereController.dart';
import 'package:profmoonv2/view/betting/proses/labouchereProsess.dart';

class Labouchere extends StatelessWidget {
  final LabouchereController labouchereController =
      Get.put(LabouchereController());
  Labouchere({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('D-Alembert'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
            child: Obx(
          () => (labouchereController.load.value)
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  children: [
                    Text("Start bet"),
                    SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: labouchereController.startController,
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
                      controller: labouchereController.probController,
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
                      controller: labouchereController.targetController,
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
                      controller: labouchereController.lossController,
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
                                labouchereController.probController.text) >
                            95) {
                          Get.snackbar("Message", "Prbability to High");
                        } else {
                          var prob = (int.parse(labouchereController
                                      .probController.text) /
                                  100 *
                                  1000) -
                              1;
                          var target = labouchereController.balance1 +
                              ((int.parse(labouchereController
                                          .targetController.text) /
                                      100) *
                                  labouchereController.balance1);
                          var loss = labouchereController.balance1 -
                              ((int.parse(labouchereController
                                          .targetController.text) /
                                      100) *
                                  labouchereController.balance1);

                          Map argument = {
                            'prob': prob.toInt(),
                            'loss': loss,
                            'target': target,
                            'start': labouchereController.startController.text,
                          };
                          Get.to(() => LabouchereProses(), arguments: argument);
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
        )),
      ),
    );
  }
}
