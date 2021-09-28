import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profmoonv2/controller/purchase/purchaseController.dart';
import 'package:profmoonv2/view/home/homeApp.dart';

class Purchase extends StatelessWidget {
  final status;
  final PurchaseController purchaseController = Get.put(PurchaseController());
  back() {
    Get.off(Homes());
  }

  Purchase({Key? key, this.status}) : super(key: key);

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
          title: Text("Purchase Apps"),
          centerTitle: true,
          elevation: 0,
        ),
        body: Center(
          child: Container(
              height: height * 30 / 100,
              width: width * 80 / 100,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              child: Obx(
                () => (purchaseController.load.value)
                    ? Center(child: CircularProgressIndicator())
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Insert Your Purchase Code",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              controller: purchaseController.codeController,
                              decoration: InputDecoration(
                                label: Text('Code'),
                              ),
                            ),
                          ),
                          ElevatedButton(
                              onPressed: () {
                                purchaseController.load.value = true;
                                purchaseController.proses(
                                    purchaseController.codeController.text);
                              },
                              child: Text('Submit'))
                        ],
                      ),
              )),
        ),
      ),
    );
  }
}
