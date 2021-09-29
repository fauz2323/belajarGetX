import 'package:flutter/material.dart';
import 'package:profmoonv2/view/betting/betting.dart';
import 'package:profmoonv2/view/betting/manualBetting.dart';
import 'package:profmoonv2/view/network/networkUser.dart';
import 'package:profmoonv2/view/purchase/purchase.dart';
import 'package:profmoonv2/view/reffRegis/reffRegis.dart';
import 'package:profmoonv2/view/transfer/historyWd.dart';
import 'package:profmoonv2/view/transfer/transfer.dart';
import 'package:profmoonv2/view/wallet/walletAdress.dart';
import 'package:profmoonv2/view/widget/homeMenu.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MenuPage extends StatelessWidget {
  final reff;
  final token;
  final balance;
  final status;

  const MenuPage({Key? key, this.token, this.balance, this.reff, this.status})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width * 80 / 100,
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
                  icon: FaIcon(FontAwesomeIcons.arrowCircleDown),
                  fun: () {
                    Get.off(() => Transfer());
                  },
                  title: "Withdraw",
                ),
                HomeMenu(
                  fun: () {
                    Get.to(() => HistoryWd());
                  },
                  icon: FaIcon(FontAwesomeIcons.fileSignature),
                  title: 'Withdraw History',
                ),
                // HomeMenu(
                //   title: "Deposit Address",
                //   fun: () {
                //     Get.to(() => WalletAddress(
                //           name: "Wallet Adress",
                //         ));
                //   },
                //   icon: FaIcon(FontAwesomeIcons.qrcode),
                // ),
                HomeMenu(
                  icon: FaIcon(FontAwesomeIcons.gem),
                  fun: (status == 'paid')
                      ? () {
                          Get.snackbar("Message", 'You is paid user');
                        }
                      : () {
                          print(status);
                          Get.off(() => Purchase(
                                status: status,
                              ));
                        },
                  title: "Purchase",
                ),
                HomeMenu(
                  icon: FaIcon(FontAwesomeIcons.userPlus),
                  fun: () {
                    Get.to(() => ReffRegis(
                          reff: reff,
                        ));
                  },
                  title: "Register",
                ),
                HomeMenu(
                  icon: FaIcon(FontAwesomeIcons.clone),
                  fun: () {
                    Get.off(() => manualBetting());
                  },
                  title: "Manual Multiply",
                ),
                HomeMenu(
                  icon: FaIcon(FontAwesomeIcons.robot),
                  fun: () {
                    Get.off(() => Multiply());
                  },
                  title: "Multiply BOT",
                ),
                HomeMenu(
                  icon: FaIcon(FontAwesomeIcons.networkWired),
                  fun: () {
                    Get.to(() => NetWorkUser());
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
