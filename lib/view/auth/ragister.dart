import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profmoonv2/controller/auth/daftarController.dart';
import 'package:flutter/services.dart';

class Register extends StatelessWidget {
  Register({Key? key}) : super(key: key);
  final register = Get.put(DaftarController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => (register.load.value)
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SafeArea(
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Text(
                            "REGISTER",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          margin: EdgeInsets.all(5),
                          child: TextFormField(
                            controller: register.usernameController,
                            decoration: InputDecoration(
                              prefixIcon: Padding(
                                padding: EdgeInsets.all(4),
                                child: Icon(Icons.people_alt_outlined),
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
                          margin: EdgeInsets.all(5),
                          child: TextFormField(
                            obscureText: register.lock.value,
                            controller: register.passwordController,
                            decoration: InputDecoration(
                              prefixIcon: Padding(
                                padding: EdgeInsets.all(4),
                                child: Icon(Icons.lock),
                              ),
                              suffixIcon: Padding(
                                padding: EdgeInsets.all(4),
                                child: IconButton(
                                    icon: (register.lock.value)
                                        ? Icon(Icons.remove_red_eye)
                                        : Icon(Icons.remove_red_eye_outlined),
                                    onPressed: () {
                                      register.lock.value =
                                          !register.lock.value;
                                    }),
                              ),
                              labelText: "Password",
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                borderSide: BorderSide(),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(5),
                          child: TextFormField(
                            obscureText: register.lock2.value,
                            controller: register.password2Controller,
                            decoration: InputDecoration(
                              prefixIcon: Padding(
                                padding: EdgeInsets.all(4),
                                child: Icon(Icons.lock),
                              ),
                              suffixIcon: Padding(
                                padding: EdgeInsets.all(4),
                                child: IconButton(
                                    icon: (register.lock2.value)
                                        ? Icon(Icons.remove_red_eye)
                                        : Icon(Icons.remove_red_eye_outlined),
                                    onPressed: () {
                                      register.lock2.value =
                                          !register.lock2.value;
                                    }),
                              ),
                              labelText: "Re-Type Password",
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                borderSide: BorderSide(),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(5),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            obscureText: register.lock3.value,
                            controller: register.pinController,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(6),
                            ],
                            decoration: InputDecoration(
                              prefixIcon: Padding(
                                padding: EdgeInsets.all(4),
                                child: Icon(Icons.vpn_key_rounded),
                              ),
                              suffixIcon: Padding(
                                padding: EdgeInsets.all(4),
                                child: IconButton(
                                    icon: (register.lock3.value)
                                        ? Icon(Icons.remove_red_eye)
                                        : Icon(Icons.remove_red_eye_outlined),
                                    onPressed: () {
                                      register.lock3.value =
                                          !register.lock3.value;
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
                        Container(
                          margin: EdgeInsets.all(5),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            obscureText: register.lock4.value,
                            controller: register.pin2Controller,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(6),
                            ],
                            decoration: InputDecoration(
                              prefixIcon: Padding(
                                padding: EdgeInsets.all(4),
                                child: Icon(Icons.vpn_key_rounded),
                              ),
                              suffixIcon: Padding(
                                padding: EdgeInsets.all(4),
                                child: IconButton(
                                    icon: (register.lock4.value)
                                        ? Icon(Icons.remove_red_eye)
                                        : Icon(Icons.remove_red_eye_outlined),
                                    onPressed: () {
                                      register.lock4.value =
                                          !register.lock4.value;
                                    }),
                              ),
                              labelText: "Re-Type Transaction Password",
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                borderSide: BorderSide(),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(5),
                          child: TextFormField(
                            controller: register.emailController,
                            decoration: InputDecoration(
                              prefixIcon: Padding(
                                padding: EdgeInsets.all(4),
                                child: Icon(Icons.people_alt_outlined),
                              ),
                              labelText: "Email",
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                borderSide: BorderSide(),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(5),
                          child: TextFormField(
                            controller: register.reffController,
                            decoration: InputDecoration(
                              prefixIcon: Padding(
                                padding: EdgeInsets.all(4),
                                child: Icon(Icons.perm_contact_cal_sharp),
                              ),
                              labelText: "Referal Username",
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                borderSide: BorderSide(),
                              ),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            register.load.value = true;

                            print("object");
                            if (register.passwordController.text !=
                                register.password2Controller.text) {
                              //if
                              register.load.value = false;

                              Get.snackbar("error", "Passwor not Match");
                            } else if (register.pinController.text !=
                                register.pin2Controller.text) {
                              register.load.value = false;

                              Get.snackbar(
                                  "error", "Transaction Password not Match");
                            } else {
                              register.daftar(
                                register.emailController.text,
                                register.usernameController.text,
                                register.passwordController.text,
                                register.pinController.text,
                                register.reffController.text,
                              );
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6))),
                            child: Text(
                              "REGISTER",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
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
