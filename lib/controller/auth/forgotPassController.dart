import 'dart:math';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ForgotPassController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  TextEditingController newPassController = TextEditingController();
  TextEditingController reNewPassController = TextEditingController();
  TextEditingController capchaController = TextEditingController();
  Random random = new Random();
  var a = 0.obs, b = 0.obs;
  var load = false.obs;

  initial() {
    a.value = random.nextInt(9);
    b.value = random.nextInt(9);
  }

  sendOtp(var email) async {
    var uri = Uri.parse('https://profmoon.com/api/resetOtp');
    Map body = {
      'email': email,
    };
    final response = await http.post(uri, body: body);
    if (response.statusCode == 200) {
      Get.snackbar("Message", "OTP send to Your Email");
    } else {
      Get.snackbar("ERROR", 'Email Not Found');
    }
    load.value = false;
  }

  proses(var email, var pass, var otp) async {
    var uri = Uri.parse('https://profmoon.com/api/resetPass');
    Map body = {
      'email': email,
      'otp': otp,
      'newPassword': pass,
    };
    final response = await http.post(uri, body: body);
    final data = json.decode(response.body);
    if (response.statusCode == 200) {
      load.value = false;
      Get.back();
      Get.snackbar('Message', 'Success');
    } else if (response.statusCode == 201) {
      load.value = false;
      Get.snackbar('Message', 'OTP not match');
    } else {
      load.value = false;
      Get.snackbar("Error", "Not Found");
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    initial();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
