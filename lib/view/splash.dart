import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profmoonv2/controller/splashController.dart';

class Splash extends StatelessWidget {
  SplashController splashController = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'asset/image/logo.png',
              width: 150,
              height: 150,
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              "TronMoon",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
          ],
        ),
      ),
    );
  }
}
