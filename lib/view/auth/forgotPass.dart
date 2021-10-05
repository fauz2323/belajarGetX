import 'package:flutter/material.dart';
import 'package:profmoonv2/controller/auth/forgotPassController.dart';
import 'package:get/get.dart';
import 'package:profmoonv2/view/auth/formAuth.dart';

class ForgotPass extends StatelessWidget {
  ForgotPassController forgotPassController = Get.put(ForgotPassController());
  ForgotPass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          title: Text("Forgot Password"),
          centerTitle: true,
          elevation: 0,
        ),
        body: Center(
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
              height: height * 75 / 100,
              // padding: EdgeInsets.all(20),
              width: width * 80 / 100,
              child: Obx(
                () => (forgotPassController.load.value)
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : Column(
                        children: <Widget>[
                          // Image(
                          //   image: AssetImage('asset/image/logo.png'),
                          //   height: 100,
                          //   width: 100,
                          // ),
                          // Text(
                          //   "DogeMoon",
                          //   style: TextStyle(fontWeight: FontWeight.bold),
                          // ),
                          FormAuth(
                            controller: forgotPassController.emailController,
                            icons: Icons.email,
                            obsecure: false,
                            label: "Username",
                          ),
                          ElevatedButton(
                              onPressed: () {
                                forgotPassController.load.value = true;
                                forgotPassController.sendOtp(
                                    forgotPassController.emailController.text);
                              },
                              child: Container(
                                width: width,
                                child: Center(child: Text('Send OTP')),
                              )),
                          FormAuth(
                            controller: forgotPassController.newPassController,
                            icons: Icons.lock,
                            obsecure: true,
                            label: "New Password",
                          ),
                          FormAuth(
                            controller:
                                forgotPassController.reNewPassController,
                            icons: Icons.lock,
                            obsecure: true,
                            label: 'Re-type New Password',
                          ),
                          FormAuth(
                            controller: forgotPassController.otpController,
                            icons: Icons.vpn_key,
                            obsecure: false,
                            label: "OTP",
                          ),
                          Obx(
                            () => Container(
                              margin: EdgeInsets.all(10),
                              child: TextFormField(
                                controller:
                                    forgotPassController.capchaController,
                                decoration: InputDecoration(
                                  labelText:
                                      "${forgotPassController.a.value} + ${forgotPassController.b.value} is ...",
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4),
                                    borderSide: BorderSide(),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          ElevatedButton(
                              onPressed: () {
                                var total = int.parse(
                                    forgotPassController.capchaController.text);
                                if (forgotPassController.a.value +
                                        forgotPassController.b.value ==
                                    total) {
                                  forgotPassController.proses(
                                      forgotPassController.emailController.text,
                                      forgotPassController
                                          .newPassController.text,
                                      forgotPassController.otpController.text);
                                } else {
                                  final snackbar = SnackBar(
                                    content: Text('Wrong Capcha Number!!!'),
                                    action: SnackBarAction(
                                        label: "close", onPressed: () {}),
                                  );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackbar);
                                }

                                forgotPassController.a.value =
                                    forgotPassController.random.nextInt(9);
                                forgotPassController.b.value =
                                    forgotPassController.random.nextInt(9);
                              },
                              child: Text("Submit")),

                          // Text("version: ${widget.version}"),
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
