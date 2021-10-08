import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:profmoonv2/controller/transfer/depoHistoryController.dart';
import 'package:profmoonv2/view/transfer/detail/detailHistory.dart';

class HistoryDepoView extends StatelessWidget {
  DepoHistoryController depoHistoryController =
      Get.put(DepoHistoryController());
  HistoryDepoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: Text("History Deposit"),
          centerTitle: true,
        ),
        body: Obx(
          () => (depoHistoryController.load.value)
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Container(
                  child: ListView.builder(
                    itemCount:
                        depoHistoryController.dataList.first.history.length,
                    itemBuilder: (context, i) {
                      return InkWell(
                        onTap: () {
                          Get.to(() => DetailHistory(
                                date: depoHistoryController
                                    .dataList.first.history[i].createdAt,
                                wallet: depoHistoryController
                                    .dataList.first.history[i].wallet,
                                amount: depoHistoryController
                                    .dataList.first.history[i].total,
                                page: "Deposit Tron",
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
                                    '${depoHistoryController.dataList.first.history[i].wallet.substring(0, 8)}...${depoHistoryController.dataList.first.history[i].wallet.substring(depoHistoryController.dataList.first.history[i].wallet.length - 4, depoHistoryController.dataList.first.history[i].wallet.length)}',
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(DateFormat('d-M-y ~ kk:mm').format(
                                      depoHistoryController
                                          .dataList.first.history[i].createdAt))
                                ],
                              ),
                              Text(depoHistoryController
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
