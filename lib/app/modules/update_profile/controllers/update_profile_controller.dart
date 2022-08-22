import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:game_islami/app/widgets/snackbar/custom_snackbar.dart';
import 'package:get/get.dart';

class UpdateProfileController extends GetxController {
  Map<String, dynamic> userDataFromArgument = Get.arguments;

  RxBool obsecureText = RxBool(true);
  TextEditingController nameC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController currentPassC = TextEditingController();
  TextEditingController passC = TextEditingController();
  TextEditingController confirmPassC = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  checkIsAnonymous() {
    print('aaaa: ${auth.currentUser!.isAnonymous}');
    return auth.currentUser!.isAnonymous;
  }

  linkAccount() async {
    if (passC.text != confirmPassC.text) {
      CustomSnackbar.errorSnackbar('Gagal', 'password dan konfirmasi password harus sama');
    } else if (emailC.text.isNotEmpty && passC.text.isNotEmpty && confirmPassC.text.isNotEmpty) {
      try {
        AuthCredential credential = EmailAuthProvider.credential(
          email: emailC.text,
          password: passC.text,
        );
        await auth.currentUser?.linkWithCredential(credential);
        String uid = auth.currentUser!.uid;
        CollectionReference usersCollection = firestore.collection('users');
        DocumentReference userDocument = usersCollection.doc(uid);
        await userDocument.update({
          'name': 'Pengguna Baru',
          'email': emailC.text,
        });
        Get.back();
        CustomSnackbar.successSnackbar('Berhasil Mendaftar', 'akun anda telah berhasil didaftarkan');
      } on FirebaseAuthException catch (e) {
        switch (e.code) {
          case "provider-already-linked":
            print("The provider has already been linked to the user.");
            CustomSnackbar.errorSnackbar('Gagal', 'akun ini sudah ditautkan');
            break;
          case "credential-already-in-use":
            CustomSnackbar.errorSnackbar('Gagal', 'data sudah terhubung ke akun lain, silahkan isi data yang berbeda');
            print("The account corresponding to the credential already exists, "
                "or is already linked to a Firebase User.");
            break;
          default:
            CustomSnackbar.errorSnackbar('Gagal', 'error : ${e.code}');
            break;
        }
      }
    } else {
      CustomSnackbar.errorSnackbar('Gagal', 'semua formulir harus diisi');
    }
  }

  Future<void> updatePassword() async {
    if (currentPassC.text.isNotEmpty && passC.text.isNotEmpty && confirmPassC.text.isNotEmpty) {
      if (passC.text == confirmPassC.text) {
        try {
          String emailUser = auth.currentUser!.email!;
          // checking if the current password is true
          await auth.signInWithEmailAndPassword(email: emailUser, password: currentPassC.text);
          // update password
          await auth.currentUser!.updatePassword(passC.text);

          Get.back();
          CustomSnackbar.successSnackbar('Success', 'success change password');
        } on FirebaseAuthException catch (e) {
          if (e.code == 'wrong-password') {
            CustomSnackbar.errorSnackbar('Error', 'current password wrong');
          } else {
            CustomSnackbar.errorSnackbar('Error', 'cant update password because : ${e.code}');
          }
        } catch (e) {
          CustomSnackbar.errorSnackbar('Error', 'error : ${e.toString()}');
        } finally {
          // TODO: isLoading.value = false;
        }
      } else {
        CustomSnackbar.errorSnackbar('Error', 'new password and confirm password doesnt match');
      }
    } else {
      CustomSnackbar.errorSnackbar('Error', 'all form must be filled');
    }
  }

  updateProfile() async {
    try {
      String uid = auth.currentUser!.uid;
      CollectionReference usersCollection = firestore.collection('users');
      DocumentReference userDocument = usersCollection.doc(uid);
      if (nameC.text.isNotEmpty) {
        //update name
        await userDocument.update({
          'name': nameC.text,
        });
        CustomSnackbar.successSnackbar('Berhasil Perbarui Nama', 'berhasil memperbarui nama');
      }

      if (passC.text.isNotEmpty && confirmPassC.text.isNotEmpty && currentPassC.text.isNotEmpty) {
        updatePassword();
        Get.back();
      } else if (passC.text.isEmpty || confirmPassC.text.isEmpty || currentPassC.text.isEmpty) {
        CustomSnackbar.errorSnackbar(
            'Gagal perbarui password', 'untuk update password harus isi semua password, jika tidak silahkan hapus yang terisi');
      }
    } catch (e) {
      CustomSnackbar.errorSnackbar('Gagal perbarui password', 'error : ${e.toString()}');
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    nameC.text = userDataFromArgument['name'];
    emailC.text = userDataFromArgument['email'] ?? '';
    super.onReady();
  }

  @override
  void onClose() {}
}
