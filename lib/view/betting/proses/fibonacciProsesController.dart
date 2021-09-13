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
                    child: SfCartesianChart(
                        enableSideBySideSeriesPlacement: false,
                        primaryXAxis: CategoryAxis(),
                        legend: Legend(isVisible: false),
                        series: <ChartSeries>[
                          LineSeries<Grafik, int>(
                            dataSource: fibbonacciProsesController.graph,
                            xValueMapper: (Grafik g, _) => g.x,
                            yValueMapper: (Grafik g, _) => g.y,
                          )
                        ]),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  DataTable(columns: [
                    DataColumn(
                      label: Text("Bet ID"),
                    ),
                    DataColumn(
                      label: Text("Profit"),
                    ),
                  ], rows: [
                    DataRow(
                      cells: [
                        DataCell(
                          Text("asd"),
                        ),
                        DataCell(
                          Text("asdasd"),
                        ),
                      ],
                    ),
                  ]),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text("STOP"),
              style: ElevatedButton.styleFrom(minimumSize: Size(190, 40)),
            ),
          ],
        ),
      ),
    );
  }
}
