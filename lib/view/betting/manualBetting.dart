import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:profmoonv2/controller/betting/manualBettingController.dart';

class manualBetting extends StatelessWidget {
  final ManualBettingController manualBettingController =
      Get.put(ManualBettingController());
  manualBetting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
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
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  controller:
                                      manualBettingController.startController,
                                  decoration:
                                      InputDecoration(label: Text("start")),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  controller:
                                      manualBettingController.probController,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                      label: Text('Probability')),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  ElevatedButton(
                                      onPressed: () {
                                        manualBettingController.startController
                                            .clear();
                                        manualBettingController.probController
                                            .clear();
                                      },
                                      child: Text('Reset Form')),
                                  ElevatedButton(
                                      onPressed: () {
                                        var prob = (int.parse(
                                                    manualBettingController
                                                        .probController.text) /
                                                100 *
                                                1000) -
                                            1;
                                        if (int.parse(manualBettingController
                                                .probController.text) >
                                            90) {
                                          Get.snackbar("Error",
                                              "Probability Terlalu Tinggi");
                                        } else {
                                          manualBettingController
                                              .loading.value = true;
                                          manualBettingController.proses(
                                              manualBettingController
                                                  .startController.text,
                                              prob.toString());
                                        }
                                      },
                                      child: Text("Start"))
                                ],
                              )
                            ],
                          ),
                  )),
              SizedBox(
                height: height * 5 / 100,
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
                                        style: TextStyle(color: datarows.warna),
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        datarows.result.payOut.toString(),
                                        style: TextStyle(color: datarows.warna),
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
    );
  }
}
