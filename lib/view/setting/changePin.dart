import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profmoonv2/controller/setting/changePassController.dart';
import 'package:profmoonv2/controller/setting/changePinController.dart';

class ChangePin extends StatelessWidget {
  final pinController = Get.put(ChangePinController());
  ChangePin({Key? key}) : super(key: key);

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
        body: Obx(() => (pinController.load.value)
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
                            obscureText: pinController.secure.value,
                            controller: pinController.oldPinController,
                            decoration: InputDecoration(
                              prefixIcon: Padding(
                                padding: EdgeInsets.all(4),
                                child: Icon(Icons.lock),
                              ),
                              suffixIcon: Padding(
                                padding: EdgeInsets.all(4),
                                child: IconButton(
                                    icon: (pinController.secure.value)
                                        ? Icon(Icons.remove_red_eye)
                                        : Icon(Icons.remove_red_eye_outlined),
                                    onPressed: () {
                                      pinController.secure.value =
                                          !pinController.secure.value;
                                    }),
                              ),
                              labelText: "Old Password Transaction",
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
                            obscureText: pinController.secure.value,
                            controller: pinController.newPinController,
                            decoration: InputDecoration(
                              prefixIcon: Padding(
                                padding: EdgeInsets.all(4),
                                child: Icon(Icons.lock_outline),
                              ),
                              suffixIcon: Padding(
                                padding: EdgeInsets.all(4),
                                child: IconButton(
                                    icon: (pinController.secure.value)
                                        ? Icon(Icons.remove_red_eye)
                                        : Icon(Icons.remove_red_eye_outlined),
                                    onPressed: () {
                                      pinController.secure.value =
                                          !pinController.secure.value;
                                    }),
                              ),
                              labelText: "New Password Transaction",
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
                            obscureText: pinController.secure.value,
                            controller: pinController.newPinController2,
                            decoration: InputDecoration(
                              prefixIcon: Padding(
                                padding: EdgeInsets.all(4),
                                child: Icon(Icons.lock_outline),
                              ),
                              suffixIcon: Padding(
                                padding: EdgeInsets.all(4),
                                child: IconButton(
                                    icon: (pinController.secure.value)
                                        ? Icon(Icons.remove_red_eye)
                                        : Icon(Icons.remove_red_eye_outlined),
                                    onPressed: () {
                                      pinController.secure.value =
                                          !pinController.secure.value;
                                    }),
                              ),
                              labelText: "Re-Type New Password Transaction",
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                borderSide: BorderSide(),
                              ),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.all(10),
                              width: 150,
                              child: TextFormField(
                                controller: pinController.otpController,
                                decoration: InputDecoration(
                                  prefixIcon: Padding(
                                    padding: EdgeInsets.all(4),
                                    child: Icon(Icons.lock_outline),
                                  ),
                                  labelText: "OTP code",
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4),
                                    borderSide: BorderSide(),
                                  ),
                                ),
                              ),
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  pinController.send();
                                },
                                child: Text("Send Code"))
                          ],
                        ),
                        ElevatedButton(
                            onPressed: () {
                              pinController.load.value = true;
                              if (pinController.newPinController.text !=
                                  pinController.newPinController2.text) {
                                pinController.load.value = false;
                                Get.snackbar(
                                    "Message", "Re-type Password not Match");
                              } else {
                                pinController.proses(
                                    pinController.newPinController.text,
                                    pinController.oldPinController.text,
                                    pinController.otpController.text);
                              }
                            },
                            child: Text("Submit")),
                      ],
                    ),
                  ),
                ),
              )),
      ),
    );
  }
}
