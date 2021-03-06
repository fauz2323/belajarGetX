import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profmoonv2/controller/betting/proses/dalembertProsesController.dart';
import 'package:profmoonv2/model/graph/graph.dart';
import 'package:profmoonv2/view/betting/betting.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DalembertProses extends StatelessWidget {
  final status;
  final DalembertProsesController dalembertProsesController =
      Get.put(DalembertProsesController());
  back() {
    Get.off(() => Multiply(
          status: status,
        ));
  }

  DalembertProses({Key? key, required this.status}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return back();
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: Text("D'Alembert"),
        ),
        body: Container(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        height: 200,
                        child: Obx(
                          () => SfCartesianChart(
                              enableSideBySideSeriesPlacement: false,
                              primaryXAxis: CategoryAxis(),
                              legend: Legend(isVisible: false),
                              series: <ChartSeries>[
                                LineSeries<Grafik, int>(
                                  color: Colors.black,
                                  dataSource:
                                      dalembertProsesController.graph.value,
                                  xValueMapper: (Grafik g, _) => g.x,
                                  yValueMapper: (Grafik g, _) => g.y,
                                )
                              ]),
                        )),
                  ],
                ),
              ),
              Container(
                padding:
                    EdgeInsets.only(left: 20, right: 20, top: 6, bottom: 6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text("Balance"),
                        Obx(() => Text(dalembertProsesController.balance1
                            .toStringAsFixed(6)))
                      ],
                    ),
                    Column(
                      children: [
                        Text("Status"),
                        Obx(() => Text((dalembertProsesController.stop.value)
                            ? 'ON'
                            : 'OFF'))
                      ],
                    ),
                    Column(
                      children: [
                        Text("Profit"),
                        Obx(() => Text(dalembertProsesController.profit
                            .toStringAsFixed(6))),
                      ],
                    )
                  ],
                ),
              ),
              Divider(),
              Expanded(
                child: ListView(
                  scrollDirection: Axis.vertical,
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
                        rows: dalembertProsesController.betting
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
                                      datarows.result.payOut.toStringAsFixed(6),
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
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  dalembertProsesController.stop.value = false;
                },
                child: Text("STOP"),
                style: ElevatedButton.styleFrom(minimumSize: Size(190, 40)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
