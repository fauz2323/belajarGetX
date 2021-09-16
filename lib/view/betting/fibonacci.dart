import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:profmoonv2/controller/betting/fibbonacciCOntroller.dart';
import 'package:profmoonv2/view/betting/proses/fibonacciProsesController.dart';

class Fibonacci extends StatelessWidget {
  final FibbonacciController fibbonacciController =
      Get.put(FibbonacciController());
  Fibonacci({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("FIBONACCI"),
      ),
      body: SingleChildScrollView(
          child: Obx(
        () => (fibbonacciController.load.value)
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
                      controller: fibbonacciController.startController,
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
                      controller: fibbonacciController.probController,
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
                      controller: fibbonacciController.targetController,
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
                      controller: fibbonacciController.lossController,
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
                                fibbonacciController.probController.text) >
                            95) {
                          Get.snackbar("Message", "Prbability to High");
                        } else {
                          var target = fibbonacciController.balance +
                              ((int.parse(fibbonacciController
                                          .targetController.text) /
                                      100) *
                                  fibbonacciController.balance);
                          var loss = fibbonacciController.balance -
                              ((int.parse(fibbonacciController
                                          .targetController.text) /
                                      100) *
                                  fibbonacciController.balance);

                          Map argument = {
                            'prob': fibbonacciController.probController.text,
                            'loss': loss,
                            'target': target,
                            'start': fibbonacciController.startController.text,
                          };
                          Get.to(() => FibonacciProses(), arguments: argument);
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
