import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profmoonv2/controller/home/homeController.dart';
import 'package:profmoonv2/view/home/home.dart';
import 'package:profmoonv2/view/home/information.dart';

class Homes extends StatelessWidget {
  final homeController = Get.put(HomesController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
            "DOGEMOON",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
          elevation: 0,
        ),
        body: Container(
          child: PageView(
            physics: NeverScrollableScrollPhysics(),
            controller: homeController.controller.value,
            onPageChanged: (index) {
              homeController.selectedNavbar.value = index;
            },
            children: [
              Home(),
              Information(),
              Home(),
              Information(),
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
                  'asset/image/dogev2.png',
                  height: 30,
                  width: 30,
                ),
                label: "DOGECHAIN",
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
    );
  }
}
