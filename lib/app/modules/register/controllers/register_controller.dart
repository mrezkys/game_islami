import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  RxBool obsecureText = RxBool(true);
  TextEditingController nameC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();
  TextEditingController confirmPassC = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
