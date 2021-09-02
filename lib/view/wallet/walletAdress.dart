import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:profmoonv2/controller/wallet/walletAdress.dart';
import 'package:profmoonv2/view/home/home.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:get/get.dart';

class WalletAddress extends StatelessWidget {
  final name;
  final walletController = Get.put(WalletAdressController());
  WalletAddress({Key? key, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return walletController.close();
      },
      child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: Text(
              name,
              style: TextStyle(color: Colors.white),
            ),
            centerTitle: true,
          ),
          backgroundColor: Colors.blue,
          body: Obx(
            () => (walletController.load.value)
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Container(
                    child: Center(
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(8),
                            margin: EdgeInsets.all(10),
                            width: 300,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Your Adress : ",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                InkWell(
                                  onLongPress: () {
                                    Clipboard.setData(ClipboardData(
                                            text: walletController
                                                .addressTron.value))
                                        .then((value) => ScaffoldMessenger.of(
                                                context)
                                            .showSnackBar(SnackBar(
                                                content: Text(
                                                    "Copy Deposit Address Success"))));
                                  },
                                  child: QrImage(
                                    data: walletController.addressTron.value,
                                    size: 200,
                                    backgroundColor: Colors.white,
                                  ),
                                ),
                                Text(
                                  "( Tap Hold QrCode to copy the address )",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Colors.white,
                            ),
                            child: FittedBox(
                              fit: BoxFit.contain,
                              child: Text(walletController.addressTron.value),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
          )),
    );
  }
}
