import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profmoonv2/controller/home/homeAppController.dart';
import 'package:profmoonv2/view/wallet/walletAdress.dart';
import 'package:profmoonv2/view/widget/balanceHome.dart';
import 'package:profmoonv2/view/widget/menuPage.dart';

class Home extends StatelessWidget {
  final homeAppController = Get.put(HomeAppController());
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
                          Text(
                            "( ${homeAppController.data!.user!.status} )",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w200,
                              fontSize: 18,
                            ),
                          ),
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
                            Get.to(() => WalletAddress(
                                  name: 'PASEO',
                                ));
                          },
                          child: BalanceHome(
                            title: "TRON",
                            image: 'asset/image/tron.png',
                            balance: homeAppController.tronBalance,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(() => WalletAddress(
                                  name: 'PASEO',
                                ));
                          },
                          child: BalanceHome(
                            title: "PASEO",
                            image: 'asset/image/logopaseo.png',
                            balance: homeAppController.paseoBalance,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: MenuPage(
                      reff: homeAppController.data!.user!.username,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
      ),
    );
  }
}
