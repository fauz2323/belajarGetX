import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profmoonv2/view/home/homeApp.dart';

class Success extends StatelessWidget {
  const Success({Key? key}) : super(key: key);

  back() {
    Get.off(Homes());
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () {
        return back();
      },
      child: Scaffold(
        backgroundColor: Colors.blue,
        body: Center(
          child: Container(
            height: height * 80 / 100,
            width: width * 80 / 100,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(8))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [],
            ),
          ),
        ),
      ),
    );
  }
}
