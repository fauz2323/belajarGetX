import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profmoonv2/controller/auth/reffRegisterController.dart';

class ReffRegis extends StatelessWidget {
  final reff;
  final reffRegisController = Get.put(ReffRegisterController());
  ReffRegis({Key? key, this.reff}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          title: Text("Register User"),
          centerTitle: true,
          elevation: 0,
        ),
        body: Obx(
          () => (reffRegisController.load.value)
              ? Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                )
              : Container(
                  child: Center(
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
                        height: 370,
                        // padding: EdgeInsets.all(20),
                        width: 320,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.all(10),
                              child: TextFormField(
                                enabled: false,
                                initialValue: reff,
                                decoration: InputDecoration(
                                  prefixIcon: Padding(
                                    padding: EdgeInsets.all(4),
                                    child: Icon(Icons.verified_user),
                                  ),
                                  labelText: "Referral",
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
                                controller: reffRegisController.userController,
                                decoration: InputDecoration(
                                  prefixIcon: Padding(
                                    padding: EdgeInsets.all(4),
                                    child: Icon(Icons.people),
                                  ),
                                  labelText: "Username",
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
                                controller: reffRegisController.emailController,
                                decoration: InputDecoration(
                                  prefixIcon: Padding(
                                      padding: EdgeInsets.all(4),
                                      child: Icon(Icons.mail)),
                                  labelText: "Email",
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4),
                                    borderSide: BorderSide(),
                                  ),
                                ),
                              ),
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  reffRegisController.load.value = true;
                                  reffRegisController.proses(
                                      reff,
                                      reffRegisController.emailController.text,
                                      reffRegisController.userController.text);
                                },
                                child: Text("Register")),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
        ));
  }
}
