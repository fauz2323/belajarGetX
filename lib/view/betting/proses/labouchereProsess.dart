import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profmoonv2/controller/betting/proses/labouchereProsesController.dart';
import 'package:profmoonv2/model/graph/graph.dart';
import 'package:profmoonv2/view/betting/betting.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class LabouchereProses extends StatelessWidget {
  final LabouchereProsesController labouchereProsesController =
      Get.put(LabouchereProsesController());
  back() {
    Get.off(() => Multiply());
  }

  LabouchereProses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: () {
        return back();
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: Text("Labouchere"),
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
                                      labouchereProsesController.graph.value,
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
                        Obx(() => Text(labouchereProsesController.balance1
                            .toStringAsFixed(6)))
                      ],
                    ),
                    Column(
                      children: [
                        Text("Status"),
                        Obx(() => Text((labouchereProsesController.stop.value)
                            ? 'ON'
                            : 'OFF'))
                      ],
                    ),
                    Column(
                      children: [
                        Text("Profit"),
                        Obx(() => Text(labouchereProsesController.profit
                            .toStringAsFixed(6))),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: height * 5 / 100,
                child: Obx(
                  () => ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: labouchereProsesController.data.length,
                    itemBuilder: (context, i) {
                      return Text("${labouchereProsesController.data[i]} - ");
                    },
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  shrinkWrap: true,
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
                        rows: labouchereProsesController.betting
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
                  labouchereProsesController.stop.value = false;
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
