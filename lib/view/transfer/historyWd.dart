import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profmoonv2/controller/transfer/historyWdController.dart';
import 'package:profmoonv2/view/notifScreen/success.dart';
import 'package:intl/intl.dart';
import 'package:profmoonv2/view/transfer/detail/detailHistory.dart';

class HistoryWd extends StatelessWidget {
  HistoryWDController historyWDController = Get.put(HistoryWDController());
  HistoryWd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: Text("History Withdraw"),
          centerTitle: true,
        ),
        body: Obx(
          () => (historyWDController.load.value)
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Container(
                  child: ListView.builder(
                    itemCount:
                        historyWDController.dataList.first.history.length,
                    itemBuilder: (context, i) {
                      return InkWell(
                        onTap: () {
                          Get.to(() => DetailHistory(
                                date: historyWDController
                                    .dataList.first.history[i].createdAt,
                                wallet: historyWDController
                                    .dataList.first.history[i].wallet,
                                amount: historyWDController
                                    .dataList.first.history[i].total,
                                page: "Withdraw Tron",
                              ));
                        },
                        child: Container(
                          margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                          padding: EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${historyWDController.dataList.first.history[i].wallet.substring(0, 8)}...${historyWDController.dataList.first.history[i].wallet.substring(historyWDController.dataList.first.history[i].wallet.length - 4, historyWDController.dataList.first.history[i].wallet.length)}',
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(DateFormat('d-M-y ~ kk:mm').format(
                                      historyWDController
                                          .dataList.first.history[i].createdAt))
                                ],
                              ),
                              Text(historyWDController
                                  .dataList.first.history[i].total)
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
        ));
  }
}
