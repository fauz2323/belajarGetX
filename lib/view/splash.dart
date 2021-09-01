import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profmoonv2/controller/splashController.dart';

class Splash extends StatelessWidget {
  final splashController = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          splashController.init();
        },
      ),
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "LOGO",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              "DogeMoon",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            )
          ],
        ),
      ),
    );
  }
}
