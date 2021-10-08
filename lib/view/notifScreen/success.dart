import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:profmoonv2/view/home/homeApp.dart';

class Success extends StatelessWidget {
  final balanceSend;
  final wallet;
  String formatedDate = DateFormat('d/M/y').format(Get.arguments);
  Success({Key? key, this.balanceSend, this.wallet}) : super(key: key);

  back() {
    Get.off(() => Homes());
  }

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
        body: Center(
          child: Container(
            height: height * 60 / 100,
            width: width * 80 / 100,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(8))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Icon(
                    Icons.verified,
                    size: 100,
                    color: Colors.blue,
                  ),
                ),
                Text(
                  "Tron Sent",
                  style: TextStyle(color: Colors.blue, fontSize: 26),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "$balanceSend Tron",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text(
                  "to Wallet : ",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
                Container(
                  padding: EdgeInsets.all(7),
                  decoration: BoxDecoration(border: Border.all(width: 0.2)),
                  child: Text(
                    '$wallet',
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
                  ),
                ),
                Divider(),
                Container(
                  padding: EdgeInsets.only(left: 40, right: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Date: "),
                      Text("$formatedDate"),
                    ],
                  ),
                ),
                Divider(),
                ElevatedButton(
                    onPressed: () {
                      Get.off(() => Homes());
                    },
                    child: Text("Home"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
