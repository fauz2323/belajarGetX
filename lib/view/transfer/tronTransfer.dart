import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:profmoonv2/controller/transfer/tronTransferController.dart';

class TronTransfer extends StatelessWidget {
  final tronTransferController = Get.put(TronsTransferController());

  TronTransfer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => (tronTransferController.load.value)
          ? Container(
              color: Colors.white,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : Scaffold(
              backgroundColor: Colors.blue,
              body: Container(
                margin: EdgeInsets.only(top: 10),
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(5),
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            )),
                        child: TextButton(
                            onPressed: () {
                              tronTransferController.scan();
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.camera_alt,
                                  size: 100,
                                  color: Colors.black,
                                ),
                                Text("Scan Code"),
                              ],
                            )),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(14),
                            )),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                  "Tron: ${tronTransferController.balance1}"),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                controller: tronTransferController
                                    .addressController.value,
                                decoration: InputDecoration(
                                  prefixIcon: Padding(
                                    padding: EdgeInsets.all(4),
                                    child: Icon(
                                        Icons.account_balance_wallet_outlined),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                controller:
                                    tronTransferController.banyakController,
                                decoration: InputDecoration(
                                  prefixIcon: Padding(
                                    padding: EdgeInsets.all(4),
                                    child: Icon(Icons.monetization_on_outlined),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly,
                                  LengthLimitingTextInputFormatter(6),
                                ],
                                keyboardType: TextInputType.number,
                                obscureText:
                                    tronTransferController.obsecure.value,
                                controller:
                                    tronTransferController.pinController,
                                decoration: InputDecoration(
                                  suffixIcon: Padding(
                                    padding: EdgeInsets.all(4),
                                    child: IconButton(
                                        icon: Obx(() => (tronTransferController
                                                .obsecure.value)
                                            ? Icon(Icons.remove_red_eye)
                                            : Icon(
                                                Icons.remove_red_eye_outlined)),
                                        onPressed: () {
                                          tronTransferController
                                                  .obsecure.value =
                                              !tronTransferController
                                                  .obsecure.value;
                                        }),
                                  ),
                                  prefixIcon: Padding(
                                    padding: EdgeInsets.all(4),
                                    child: Icon(Icons.lock),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(),
                                  ),
                                ),
                              ),
                            ),
                            Center(
                              child: Container(
                                padding: EdgeInsets.only(
                                  left: 8,
                                  right: 8,
                                ),
                                margin: EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                child: TextButton(
                                  onPressed: () {
                                    // tronTransferController.load.value = true;
                                    var angka = double.parse(
                                        tronTransferController
                                            .banyakController.text);
                                    print("aaasss");

                                    tronTransferController.proses(
                                      angka.toString(),
                                      tronTransferController
                                          .addressController.value.text,
                                      tronTransferController.pinController.text,
                                    );
                                  },
                                  child: Text(
                                    "Submit",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
