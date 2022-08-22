import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:game_islami/app/controllers/game_controller.dart';
import 'package:game_islami/app/modules/login/controllers/login_controller.dart';
import 'package:game_islami/app/routes/app_pages.dart';
import 'package:game_islami/app/widgets/snackbar/custom_snackbar.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  var gameC = Get.find<GameController>();
  var loginC = Get.find<LoginController>();

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  RxBool obsecureText = RxBool(true);
  TextEditingController nameC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();
  TextEditingController confirmPassC = TextEditingController();

  register() async {
    if (nameC.text.isNotEmpty && emailC.text.isNotEmpty && passC.text.isNotEmpty && confirmPassC.text.isNotEmpty) {
      if (passC.text == confirmPassC.text) {
        try {
          UserCredential userCredential =
              await FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailC.text, password: passC.text);
          String uid = userCredential.user!.uid;
          CollectionReference usersCollection = firestore.collection('users');
          DocumentReference userDocument = usersCollection.doc(uid);
          await userDocument.set({
            'name': nameC.text,
            'point': 10,
            'email': userCredential.user!.email,
          });

          // re init game data
          await gameC.initGame();

          Get.toNamed(Routes.HOME);
          CustomSnackbar.successSnackbar('Berhasil', 'akun telah terdaftar');
        } on FirebaseAuthException catch (e) {
          if (e.code == 'weak-password') {
            print('The password provided is too weak.');
            CustomSnackbar.errorSnackbar('Gagal', 'password terlalu lemah');
          } else if (e.code == 'email-already-in-use') {
            print('The account already exists for that email.');
            CustomSnackbar.errorSnackbar('Gagal', 'email telah digunakan');
          }
        } catch (e) {
          print(e);
          CustomSnackbar.errorSnackbar('Gagal', 'error : $e');
        }
      } else {
        //error pass not same
        CustomSnackbar.errorSnackbar('Gagal', 'Password & Konfirmasi Password tidak sama');
      }
    } else {
      // cant be empty
      CustomSnackbar.errorSnackbar('Gagal', 'semua data harus diisi');
    }
  }

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
