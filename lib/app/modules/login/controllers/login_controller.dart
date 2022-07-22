import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:game_islami/app/routes/app_pages.dart';
import 'package:game_islami/app/widgets/snackbar/custom_snackbar.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  RxBool obsecureText = RxBool(true);
  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  loginAnonymously() async {
    try {
      UserCredential credential = await auth.signInAnonymously();
      if (credential.user != null) {
        String uid = credential.user!.uid;
        CollectionReference usersCollection = firestore.collection('users');
        DocumentReference userDocument = usersCollection.doc(uid);
        await userDocument.set({
          'name': 'Pengguna Baru',
          'point': 10,
          'email': credential.user!.email,
        });
      }
      print('berhasil');
      Get.toNamed(Routes.HOME);
    } catch (e) {
      print(e);
    }
  }

  login() async {
    if (emailC.text.isNotEmpty && passC.text.isNotEmpty) {
      try {
        await auth.signInWithEmailAndPassword(
          email: emailC.text,
          password: passC.text,
        );
        Get.offAndToNamed(Routes.HOME);
      } on FirebaseAuthException catch (e) {
        // isLoading.value = false;
        if (e.code == 'user-not-found') {
          CustomSnackbar.errorSnackbar("Gagal", "Akun tidak ditemukan");
        } else if (e.code == 'wrong-password') {
          CustomSnackbar.errorSnackbar("Gagal", "Password salah");
        }
      } catch (e) {
        CustomSnackbar.errorSnackbar("Gagal", "error : ${e.toString()}");
      }
    } else {
      CustomSnackbar.errorSnackbar('Gagal', 'semua formulir harus diisi');
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
