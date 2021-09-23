import 'package:flutter/material.dart';
import 'package:profmoonv2/controller/betting/proses/fibonacciprosesController.dart';
import 'package:profmoonv2/model/graph/graph.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:get/get.dart';

class FibonacciProses extends StatelessWidget {
  final FibbonacciProsesController fibbonacciProsesController =
      Get.put(FibbonacciProsesController());
  FibonacciProses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text("Tittle"),
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
                                dataSource:
                                    fibbonacciProsesController.graph.value,
                                xValueMapper: (Grafik g, _) => g.x,
                                yValueMapper: (Grafik g, _) => g.y,
                              )
                            ]),
                      )),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20, right: 20, top: 6, bottom: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [Text("a"), Text("data")],
              ),
            ),
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
                      rows: fibbonacciProsesController.betting
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
              ),
            ),
            ElevatedButton(
              onPressed: () {
                fibbonacciProsesController.stop.value = false;
              },
              child: Text("STOP"),
              style: ElevatedButton.styleFrom(minimumSize: Size(190, 40)),
            ),
          ],
        ),
      ),
    );
  }
}
