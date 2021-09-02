import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profmoonv2/controller/setting/changePassController.dart';

class ChangePassword extends StatelessWidget {
  final changepassController = Get.put(ChangePassController());
  ChangePassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          title: Text("Change Password"),
          centerTitle: true,
          elevation: 0,
        ),
        body: Obx(
          () => (changepassController.load.value)
              ? Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                )
              : Center(
                  child: SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3),
                          )
                        ],
                      ),
                      height: 470,
                      // padding: EdgeInsets.all(20),
                      width: 320,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.all(10),
                            child: TextFormField(
                              obscureText: changepassController.secure.value,
                              controller:
                                  changepassController.passwordOldController,
                              decoration: InputDecoration(
                                prefixIcon: Padding(
                                  padding: EdgeInsets.all(4),
                                  child: Icon(Icons.lock),
                                ),
                                suffixIcon: Padding(
                                  padding: EdgeInsets.all(4),
                                  child: IconButton(
                                      icon: (changepassController.secure.value)
                                          ? Icon(Icons.remove_red_eye)
                                          : Icon(Icons.remove_red_eye_outlined),
                                      onPressed: () {
                                        changepassController.secure.value =
                                            !changepassController.secure.value;
                                      }),
                                ),
                                labelText: "Old Password",
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  borderSide: BorderSide(),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(10),
                            child: TextFormField(
                              obscureText: changepassController.secure.value,
                              controller:
                                  changepassController.passwordNewController,
                              decoration: InputDecoration(
                                prefixIcon: Padding(
                                  padding: EdgeInsets.all(4),
                                  child: Icon(Icons.lock_outline),
                                ),
                                suffixIcon: Padding(
                                  padding: EdgeInsets.all(4),
                                  child: IconButton(
                                      icon: (changepassController.secure.value)
                                          ? Icon(Icons.remove_red_eye)
                                          : Icon(Icons.remove_red_eye_outlined),
                                      onPressed: () {
                                        changepassController.secure.value =
                                            !changepassController.secure.value;
                                      }),
                                ),
                                labelText: "New Password",
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  borderSide: BorderSide(),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(10),
                            child: TextFormField(
                              obscureText: changepassController.secure.value,
                              controller:
                                  changepassController.passwordNewController2,
                              decoration: InputDecoration(
                                prefixIcon: Padding(
                                  padding: EdgeInsets.all(4),
                                  child: Icon(Icons.lock_outline),
                                ),
                                suffixIcon: Padding(
                                  padding: EdgeInsets.all(4),
                                  child: IconButton(
                                      icon: (changepassController.secure.value)
                                          ? Icon(Icons.remove_red_eye)
                                          : Icon(Icons.remove_red_eye_outlined),
                                      onPressed: () {
                                        changepassController.secure.value =
                                            !changepassController.secure.value;
                                      }),
                                ),
                                labelText: "Re-Type New Password",
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  borderSide: BorderSide(),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(10),
                            child: TextFormField(
                              obscureText: changepassController.secure.value,
                              controller: changepassController.pinController,
                              decoration: InputDecoration(
                                prefixIcon: Padding(
                                  padding: EdgeInsets.all(4),
                                  child: Icon(Icons.vpn_key),
                                ),
                                suffixIcon: Padding(
                                  padding: EdgeInsets.all(4),
                                  child: IconButton(
                                      icon: (changepassController.secure.value)
                                          ? Icon(Icons.remove_red_eye)
                                          : Icon(Icons.remove_red_eye_outlined),
                                      onPressed: () {
                                        changepassController.secure.value =
                                            !changepassController.secure.value;
                                      }),
                                ),
                                labelText: "Transaction Password",
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  borderSide: BorderSide(),
                                ),
                              ),
                            ),
                          ),
                          ElevatedButton(
                              onPressed: () {
                                if (changepassController
                                        .passwordNewController.text !=
                                    changepassController
                                        .passwordNewController2.text) {
                                  Get.snackbar("Message",
                                      "passwor and re-type password not match");
                                } else {
                                  changepassController.load.value = true;
                                  changepassController.proses(
                                      changepassController
                                          .passwordOldController.text,
                                      changepassController
                                          .passwordNewController.text,
                                      changepassController.pinController.text);
                                }
                              },
                              child: Text("Submit")),
                        ],
                      ),
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
