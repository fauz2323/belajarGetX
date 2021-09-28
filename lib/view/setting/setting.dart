import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profmoonv2/controller/setting/settingController.dart';
import 'package:profmoonv2/view/setting/changePassword.dart';
import 'package:profmoonv2/view/setting/changePin.dart';

class Setting extends StatelessWidget {
  final settingController = Get.put(SettingController());
  Setting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Obx(
      () => (settingController.load.value)
          ? Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            )
          : Scaffold(
              backgroundColor: Colors.blue,
              body: Center(
                child: Container(
                  margin: EdgeInsets.only(top: 10, bottom: 10),
                  width: width * 9 / 10,
                  height: height * 7 / 10,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(9))),
                  padding:
                      EdgeInsets.only(top: 5, right: 16, left: 16, bottom: 10),
                  child: Stack(
                    children: [
                      // Align(
                      //     alignment: Alignment.topRight,
                      //     child: Material(
                      //       color: Colors.transparent,
                      //       child: IconButton(
                      //           icon: Icon(
                      //             Icons.edit,
                      //             color: Colors.blue,
                      //           ),
                      //           color: Colors.black,
                      //           onPressed: () {}),
                      //     )),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: height * 5 / 100,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              "${settingController.data.user!.name}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 35,
                                  color: Colors.blue),
                            ),
                          ),
                          Center(
                            child: Text(
                              '${settingController.data.status} User',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: Colors.blue),
                            ),
                          ),
                          SizedBox(
                            height: height * 5 / 100,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Your Email",
                              style: TextStyle(
                                  color: Colors.blue.shade200,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 16),
                            ),
                          ),
                          Text("${settingController.data.user!.email}",
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              )),
                          Divider(
                            color: Colors.black,
                            height: 1,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            "Join Date",
                            style: TextStyle(
                                color: Colors.blue.shade200,
                                fontWeight: FontWeight.w300,
                                fontSize: 16),
                          ),
                          Text("${settingController.data.user!.joinDate}",
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              )),
                          Divider(
                            color: Colors.black,
                            height: 1,
                          ),
                          SizedBox(
                            height: height * 10 / 100,
                          ),
                          TextButton(
                            child: Container(
                              padding: EdgeInsets.all(10),
                              width: width * 70 / 100,
                              child: Center(child: Text("Change Password")),
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 1, color: Colors.blue),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                            ),
                            onPressed: () {
                              Get.to(() => ChangePassword());
                            },
                          ),
                          TextButton(
                            child: Container(
                              padding: EdgeInsets.all(10),
                              width: width * 70 / 100,
                              child: Center(
                                  child: Text("Change Transaction Password")),
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 1, color: Colors.blue),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                            ),
                            onPressed: () {
                              Get.to(() => ChangePin());
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
    ));
  }
}
