import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profmoonv2/controller/home/homeAppController.dart';
import 'package:profmoonv2/view/notifScreen/success.dart';
import 'package:profmoonv2/view/wallet/walletAdress.dart';
import 'package:profmoonv2/view/widget/balanceHome.dart';
import 'package:profmoonv2/view/widget/menuPage.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Home extends StatelessWidget {
  final name;
  final homeAppController = Get.put(HomeAppController());

  Home({Key? key, this.name}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Obx(
        () => (homeAppController.load.value)
            ? Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, bottom: 15),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Row(
                        children: [
                          Text(
                            "Hello, ${homeAppController.data!.user!.name}",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          // Text(
                          //   "( ${homeAppController.data!.status} )",
                          //   style: TextStyle(
                          //     color: Colors.white,
                          //     fontWeight: FontWeight.w200,
                          //     fontSize: 18,
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () {
                            // Get.to(() => WalletAddress(
                            //       name: 'PASEO',
                            //     ));
                            Get.to(Success());
                          },
                          child: BalanceHome(
                            title: "TRON",
                            image: 'asset/image/tron.png',
                            balance: homeAppController.tronBalance.value,
                            widget: QrImage(
                              data: homeAppController.tronAdress,
                              size: 95,
                              backgroundColor: Colors.white,
                            ),
                          ),
                        ),

                        // InkWell(
                        //   onTap: () {
                        //     Get.to(() => WalletAddress(
                        //           name: 'PASEO',
                        //         ));
                        //   },
                        //   child: BalanceHome(
                        //     title: "PASEO",
                        //     image: 'asset/image/logopaseo.png',
                        //     balance: homeAppController.paseoBalance,
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: MenuPage(
                      status: homeAppController.data!.status,
                      reff: homeAppController.data!.user!.username,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
      ),
    );
  }
}
