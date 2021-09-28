import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:profmoonv2/controller/betting/proses/martiangleProsesController.dart';
import 'package:profmoonv2/model/graph/graph.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../betting.dart';

class MartiangleProses extends StatelessWidget {
  final MartiangleProsesCOntroller martiangleProsesCOntroller =
      Get.put(MartiangleProsesCOntroller());
  back() {
    Get.off(Multiply());
  }

  MartiangleProses({
    Key? key,
  }) : super(key: key);

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
          title: Text("Martiangle"),
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
                              backgroundColor: Colors.transparent,
                              enableSideBySideSeriesPlacement: false,
                              primaryXAxis: CategoryAxis(),
                              legend: Legend(
                                isVisible: false,
                              ),
                              series: <ChartSeries>[
                                LineSeries<Grafik, int>(
                                  color: Colors.black,
                                  dataSource:
                                      martiangleProsesCOntroller.graph.value,
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
                    Obx(
                      () => Column(
                        children: [
                          Text("Balance"),
                          Text(martiangleProsesCOntroller.balance1.value
                              .toStringAsFixed(4))
                        ],
                      ),
                    ),
                    Obx(() => Column(
                          children: [
                            Text('Status'),
                            Text((martiangleProsesCOntroller.stop.value)
                                ? 'ON'
                                : 'OFF')
                          ],
                        )),
                    Obx(() => Column(
                          children: [
                            Text("Profit"),
                            Text(martiangleProsesCOntroller.profit.value
                                .toStringAsFixed(4))
                          ],
                        ))
                  ],
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
                        rows: martiangleProsesCOntroller.betting
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
                  martiangleProsesCOntroller.stop.value = false;
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
