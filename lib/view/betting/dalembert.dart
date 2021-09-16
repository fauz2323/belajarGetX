import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:profmoonv2/controller/betting/dalembertController.dart';
import 'package:profmoonv2/view/betting/proses/dalembertProses.dart';

class Dalembert extends StatelessWidget {
  final DalembertController dalembertController =
      Get.put(DalembertController());
  Dalembert({Key? key}) : super(key: key);

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
          () => (dalembertController.load.value)
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
                      controller: dalembertController.startController,
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
                      controller: dalembertController.probController,
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
                      controller: dalembertController.targetController,
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
                      controller: dalembertController.lossController,
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
                        if (int.parse(dalembertController.probController.text) >
                            95) {
                          Get.snackbar("Message", "Prbability to High");
                        } else {
                          var target = dalembertController.balance +
                              ((int.parse(dalembertController
                                          .targetController.text) /
                                      100) *
                                  dalembertController.balance);
                          var loss = dalembertController.balance -
                              ((int.parse(dalembertController
                                          .targetController.text) /
                                      100) *
                                  dalembertController.balance);

                          Map argument = {
                            'prob': dalembertController.probController.text,
                            'loss': loss,
                            'target': target,
                            'start': dalembertController.startController.text,
                          };
                          Get.to(() => DalembertProses(), arguments: argument);
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
