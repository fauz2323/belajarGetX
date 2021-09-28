import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:profmoonv2/controller/betting/manualBettingController.dart';
import 'package:profmoonv2/view/home/homeApp.dart';

class manualBetting extends StatelessWidget {
  final ManualBettingController manualBettingController =
      Get.put(ManualBettingController());

  back() {
    Get.off(Homes());
  }

  manualBetting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () {
        return back();
      },
      child: Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          title: Text("Manual Betting"),
          centerTitle: true,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    height: height * 40 / 100,
                    width: width * 80 / 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    child: Obx(
                      () => (manualBettingController.loading.value)
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: width * 50 / 100,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: TextFormField(
                                          keyboardType: TextInputType.number,
                                          controller: manualBettingController
                                              .startController,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide:
                                                      BorderSide(width: 2)),
                                              label: Text("start")),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: width * 10 / 100,
                                      child: TextButton(
                                        onPressed: () {
                                          var total = double.parse(
                                                  manualBettingController
                                                      .startController.text) +
                                              (double.parse(
                                                      manualBettingController
                                                          .startController
                                                          .text) /
                                                  2);
                                          manualBettingController
                                              .startController
                                              .text = total.toString();
                                        },
                                        child: Text('1/2'),
                                        style: TextButton.styleFrom(
                                          primary: Colors.white,
                                          backgroundColor: Colors.blue,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    SizedBox(
                                      width: width * 10 / 100,
                                      child: TextButton(
                                        onPressed: () {
                                          var total = double.parse(
                                                  manualBettingController
                                                      .startController.text) *
                                              2;
                                          manualBettingController
                                              .startController
                                              .text = total.toString();
                                        },
                                        child: Text('2'),
                                        style: TextButton.styleFrom(
                                          primary: Colors.white,
                                          backgroundColor: Colors.blue,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    enabled: false,
                                    controller:
                                        manualBettingController.probController,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(width: 2)),
                                        label: Text('Probability')),
                                  ),
                                ),
                                Slider(
                                    value: manualBettingController
                                        .sliderValue.value,
                                    min: 10,
                                    max: 90,
                                    divisions: 500,
                                    onChanged: (double val) {
                                      manualBettingController
                                          .sliderValue.value = val;
                                      manualBettingController
                                          .probController.text = val.toString();
                                    }),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    ElevatedButton(
                                        onPressed: () {
                                          manualBettingController
                                              .startController
                                              .clear();
                                          manualBettingController
                                              .probController.text = '49.99';
                                          manualBettingController
                                              .sliderValue.value = 49.99;
                                        },
                                        child: Text('Reset')),
                                    ElevatedButton(
                                        onPressed: () {
                                          var prob = (manualBettingController
                                                      .sliderValue.value /
                                                  100 *
                                                  1000) -
                                              1;
                                          if (manualBettingController
                                              .startController.text.isEmpty) {
                                            Get.snackbar("error", "Empty Form");
                                          } else {
                                            manualBettingController
                                                .loading.value = true;
                                            print(prob.toInt());
                                            print(manualBettingController
                                                .startController.text);
                                            manualBettingController.proses(
                                                manualBettingController
                                                    .startController.text,
                                                prob.toInt());
                                            // manualBettingController
                                            //     .loading.value = true;
                                            // manualBettingController.proses(
                                            //     manualBettingController
                                            //         .startController.value.text,
                                            //     prob.toString());
                                          }
                                        },
                                        child: Text("Roll Dice"))
                                  ],
                                )
                              ],
                            ),
                    )),
                Obx(
                  () => SizedBox(
                    height: height * 5 / 100,
                    child: Align(
                      child: Text(
                        "Balance : ${manualBettingController.balance.value}",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      alignment: Alignment.center,
                    ),
                  ),
                ),
                Container(
                    height: height * 40 / 100,
                    width: width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: ListView(
                      children: [
                        Obx(
                          () => DataTable(
                            columns: [
                              DataColumn(
                                label: Text("Result"),
                              ),
                              DataColumn(
                                label: Text("Profit"),
                              ),
                            ],
                            rows: manualBettingController.betting
                                .map(
                                  (datarows) => DataRow(
                                    cells: [
                                      DataCell(
                                        Text(
                                          datarows.result.message,
                                          style:
                                              TextStyle(color: datarows.warna),
                                        ),
                                      ),
                                      DataCell(
                                        Text(
                                          datarows.result.payOut.toString(),
                                          style:
                                              TextStyle(color: datarows.warna),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                                .toList()
                                .reversed
                                .toList(),
                          ),
                        )
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
