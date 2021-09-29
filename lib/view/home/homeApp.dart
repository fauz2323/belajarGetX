import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profmoonv2/controller/home/homeController.dart';
import 'package:profmoonv2/view/home/home.dart';
import 'package:profmoonv2/view/home/information.dart';
import 'package:profmoonv2/view/setting/setting.dart';

class Homes extends StatelessWidget {
  HomesController homeController = Get.put(HomesController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Obx(
      () => (homeController.load.value)
          ? Container(
              child: Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
              color: Colors.blue,
            )
          : Scaffold(
              backgroundColor: Colors.blue,
              appBar: AppBar(
                actions: [
                  Container(
                    padding: EdgeInsets.only(right: 20),
                    child: IconButton(
                      icon: Icon(
                        Icons.logout,
                        size: 40,
                      ),
                      onPressed: () {
                        homeController.logout();
                      },
                    ),
                  ),
                ],
                title: Text(
                  (homeController.users!.status == 'paid')
                      ? "TRONMOON"
                      : "TRONMOON (trial)",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                elevation: 0,
              ),
              // body: PageView(
              //   onPageChanged: (index) {
              //     homeController.selectedNavbar.value = index;
              //   },
              //   children: [
              //     Home(),
              //     Information(),
              //     Home(),
              //     Information(),
              //   ],
              // ),
              body: Obx(
                () => IndexedStack(
                  index: homeController.selectedNavbar.value,
                  children: [
                    Home(
                      name: homeController.users!.user!.name,
                      status: homeController.users!.status,
                      balance: homeController.balance,
                      tronAddress: homeController.tronAdress,
                    ),
                    Information(),
                    Setting(),
                  ],
                ),
              ),
              bottomNavigationBar: Obx(
                () => BottomNavigationBar(
                  items: <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: "Home",
                    ),
                    BottomNavigationBarItem(
                      icon: Image.asset(
                        'asset/image/trons.png',
                        height: 30,
                        width: 30,
                      ),
                      label: "TRONSCAN",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.settings),
                      label: "Setting",
                    ),
                  ],
                  currentIndex: homeController.selectedNavbar.value,
                  selectedItemColor: Colors.blue,
                  unselectedItemColor: Colors.black,
                  showSelectedLabels: true,
                  onTap: homeController.changeSelectedNumber,
                ),
              ),
            ),
    ));
  }
}
