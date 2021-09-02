import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:profmoonv2/controller/transfer/paseoTransferController.dart';

class PaseoTransfer extends StatelessWidget {
  final paseoTransferController = Get.put(PaseoTransferController());
  PaseoTransfer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => (paseoTransferController.load.value)
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
                          onPressed: () {},
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
                                "Paseo: ${paseoTransferController.balance1}"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              controller: paseoTransferController
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
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              keyboardType: TextInputType.number,
                              controller:
                                  paseoTransferController.banyakController,
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
                                  paseoTransferController.obscure.value,
                              controller: paseoTransferController.pinController,
                              decoration: InputDecoration(
                                suffixIcon: Padding(
                                  padding: EdgeInsets.all(4),
                                  child: IconButton(
                                      icon: (paseoTransferController
                                              .obscure.value)
                                          ? Icon(Icons.remove_red_eye)
                                          : Icon(Icons.remove_red_eye_outlined),
                                      onPressed: () {
                                        paseoTransferController.obscure.value =
                                            !paseoTransferController
                                                .obscure.value;
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
                                  var angka = int.parse(paseoTransferController
                                      .banyakController.text);
                                  print("aaasss");
                                  paseoTransferController.proses(
                                    angka.toString(),
                                    paseoTransferController
                                        .addressController.value.text,
                                    paseoTransferController.pinController.text,
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
          ));
  }
}
