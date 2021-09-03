import 'package:flutter/material.dart';
import 'package:profmoonv2/view/betting/betting.dart';
import 'package:profmoonv2/view/network/networkUser.dart';
import 'package:profmoonv2/view/purchase/purchase.dart';
import 'package:profmoonv2/view/reffRegis/reffRegis.dart';
import 'package:profmoonv2/view/transfer/transfer.dart';
import 'package:profmoonv2/view/wallet/walletAdress.dart';
import 'package:profmoonv2/view/widget/homeMenu.dart';
import 'package:get/get.dart';

class MenuPage extends StatelessWidget {
  final reff;
  final token;
  final balance;

  const MenuPage({Key? key, this.token, this.balance, this.reff})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 9,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Menu",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                )),
          ),
          Expanded(
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                HomeMenu(
                  icon: Icons.money_rounded,
                  fun: () {
                    Get.off(Transfer());
                  },
                  title: "Transfer",
                ),
                HomeMenu(
                  title: "Wallet Address",
                  fun: () {
                    Get.to(() => WalletAddress(
                          name: "Wallet Adress",
                        ));
                  },
                  icon: Icons.qr_code_rounded,
                ),
                HomeMenu(
                  icon: Icons.ac_unit,
                  fun: () {
                    Get.to(() => Purchase());
                  },
                  title: "Purchase",
                ),
                HomeMenu(
                  icon: Icons.ac_unit,
                  fun: () {
                    Get.to(() => ReffRegis(
                          reff: reff,
                        ));
                  },
                  title: "Register",
                ),
                HomeMenu(
                  icon: Icons.ac_unit,
                  fun: () {
                    Get.off(Multiply());
                  },
                  title: "Multiply BOT",
                ),
                HomeMenu(
                  icon: Icons.ac_unit,
                  fun: () {
                    Get.to(NetWorkUser());
                  },
                  title: "Network",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
