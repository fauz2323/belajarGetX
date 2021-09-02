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
                  height: height * 8 / 10,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(9))),
                  padding:
                      EdgeInsets.only(top: 5, right: 16, left: 16, bottom: 10),
                  child: Stack(
                    children: [
                      Align(
                          alignment: Alignment.topRight,
                          child: Material(
                            color: Colors.transparent,
                            child: IconButton(
                                icon: Icon(
                                  Icons.edit,
                                  color: Colors.blue,
                                ),
                                color: Colors.black,
                                onPressed: () {}),
                          )),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                              "Paid Users",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: Colors.blue),
                            ),
                          ),
                          SizedBox(
                            height: 30,
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
                                fontSize: 20,
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
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              )),
                          Divider(
                            color: Colors.black,
                            height: 1,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Expanded(
                            child: GridView.count(
                              crossAxisCount: 2,
                              children: [
                                Container(
                                  margin: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                    color: Colors.blue,
                                  )),
                                  child: Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      onTap: () {
                                        Get.to(ChangePassword());
                                      },
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Icon(Icons.lock),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Text("Change Password")
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                    color: Colors.blue,
                                  )),
                                  child: Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      onTap: () {
                                        Get.to(ChangePin());
                                      },
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Icon(Icons.vpn_key),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                            "Change Transaction Password",
                                            textAlign: TextAlign.center,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
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
