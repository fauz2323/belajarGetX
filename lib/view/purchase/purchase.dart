import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profmoonv2/controller/purchase/purchaseController.dart';

class Purchase extends StatelessWidget {
  final status;
  final PurchaseController purchaseController = Get.put(PurchaseController());
  Purchase({Key? key, this.status}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text("Purchase Apps"),
        // centerTitle: true,
        elevation: 0,
      ),
      body: Center(
          child: Obx(
        () => (purchaseController.load.value)
            ? CircularProgressIndicator(
                color: Colors.white,
              )
            : Container(
                width: 300,
                height: 400,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: EdgeInsets.all(11),
                      child: Text(
                        "Balance",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 24,
                        ),
                      ),
                    ),
                    Text(
                      "${purchaseController.paseoBalance} Paseo",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 24,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Total Bill",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "${purchaseController.cost.value} Paseo",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 24,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          color: (purchaseController.onn.value)
                              ? Colors.red
                              : Colors.blue),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          hoverColor: Colors.black,
                          onTap: (purchaseController.onn.value)
                              ? null
                              : () {
                                  purchaseController.proses();
                                },
                          child: Padding(
                            padding: EdgeInsets.only(
                                bottom: 10, top: 10, left: 40, right: 40),
                            child: Text(purchaseController.text.value,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      )),
    );
  }
}
