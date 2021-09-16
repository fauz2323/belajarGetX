import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profmoonv2/controller/auth/loginController.dart';
import 'package:profmoonv2/view/auth/ragister.dart';

class Login extends StatelessWidget {
  final loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Obx(
        () => (loginController.load.value)
            ? Center(child: CircularProgressIndicator())
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
                    height: 480,
                    // padding: EdgeInsets.all(20),
                    width: 300,
                    child: Column(
                      children: <Widget>[
                        Image(
                          image: AssetImage('asset/image/logo.png'),
                          height: 100,
                          width: 100,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "LOGIN",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 26,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          child: TextFormField(
                            controller: loginController.emailController,
                            decoration: InputDecoration(
                              prefixIcon: Padding(
                                padding: EdgeInsets.all(4),
                                child: Icon(Icons.people_alt),
                              ),
                              labelText: "Username",
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                borderSide: BorderSide(),
                              ),
                            ),
                          ),
                        ),
                        Obx(
                          () => Container(
                            margin: EdgeInsets.all(10),
                            child: TextFormField(
                              controller: loginController.passwordController,
                              obscureText: loginController.lock.value,
                              decoration: InputDecoration(
                                suffixIcon: Padding(
                                  padding: EdgeInsets.all(4),
                                  child: IconButton(
                                      icon: (loginController.lock.value)
                                          ? Icon(Icons.remove_red_eye)
                                          : Icon(Icons.remove_red_eye_outlined),
                                      onPressed: () {
                                        loginController.lock.value =
                                            !loginController.lock.value;
                                      }),
                                ),
                                prefixIcon: Padding(
                                  padding: EdgeInsets.all(4),
                                  child: Icon(Icons.lock),
                                ),
                                labelText: "Password",
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  borderSide: BorderSide(),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            TextButton(
                              onPressed: () {
                                loginController.login(
                                    loginController.emailController.text,
                                    loginController.passwordController.text);
                              },
                              child: Container(
                                margin: EdgeInsets.only(right: 10),
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: Text(
                                  "LOGIN",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                            TextButton(
                                onPressed: () {
                                  Get.to(Register());
                                },
                                child: Container(
                                  margin: EdgeInsets.only(left: 10),
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  child: Text(
                                    "REGISTER",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                )),
                          ],
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Container(
                            child: Text("Forgot Password"),
                          ),
                        ),
                        Obx(
                          () => Text("version: ${loginController.version}"),
                        )
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
