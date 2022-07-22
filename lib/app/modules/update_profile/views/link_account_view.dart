import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:game_islami/app/modules/update_profile/controllers/update_profile_controller.dart';
import 'package:game_islami/app/style/app_color.dart';
import 'package:game_islami/app/widgets/custom_input.dart';
import 'package:get/get.dart';

class LinkAccountView extends GetView<UpdateProfileController> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 8),
          color: AppColor.secondary,
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColor.secondaryLight,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              'Anda masuk tanpa akun ( akun tamu ) . Untuk memperbarui profil, anda perlu membuat akun terlebih dahulu. Data akun tamu anda sekarang tetap akan tersimpan.',
              style: TextStyle(
                color: Colors.white.withOpacity(0.7),
                fontWeight: FontWeight.w400,
                height: 150 / 100,
              ),
            ),
          ),
        ),
        CustomInput(
          margin: EdgeInsets.only(left: 16, right: 16, top: 24, bottom: 16),
          controller: controller.emailC,
          label: 'email',
          hint: 'emailkamu@email.com',
          hintColor: AppColor.secondary.withOpacity(0.5),
        ),
        Obx(
          () => CustomInput(
            margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
            controller: controller.passC,
            label: 'password',
            hint: '**********',
            hintColor: AppColor.secondary.withOpacity(0.5),
            obsecureText: controller.obsecureText.value,
            suffixIcon: IconButton(
              icon: (controller.obsecureText.value != false)
                  ? Icon(
                      Icons.visibility,
                      color: AppColor.secondary,
                    )
                  : Icon(
                      Icons.visibility_off,
                      color: AppColor.secondary,
                    ),
              onPressed: () {
                controller.obsecureText.value = !(controller.obsecureText.value);
              },
            ),
          ),
        ),
        Obx(
          () => CustomInput(
            margin: EdgeInsets.only(left: 16, right: 16, bottom: 24),
            controller: controller.confirmPassC,
            label: 'konfirmasi password',
            hint: '**********',
            hintColor: AppColor.secondary.withOpacity(0.5),
            obsecureText: controller.obsecureText.value,
            suffixIcon: IconButton(
              icon: (controller.obsecureText.value != false)
                  ? Icon(
                      Icons.visibility,
                      color: AppColor.secondary,
                    )
                  : Icon(
                      Icons.visibility_off,
                      color: AppColor.secondary,
                    ),
              onPressed: () {
                controller.obsecureText.value = !(controller.obsecureText.value);
              },
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16),
          width: MediaQuery.of(context).size.width,
          child: ElevatedButton(
            onPressed: () {
              if (controller.checkIsAnonymous()) {
                controller.linkAccount();
              }
            },
            child: Text(
              'Daftar',
              style: TextStyle(
                fontFamily: 'poppins',
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColor.secondary,
              ),
            ),
            style: ElevatedButton.styleFrom(
              primary: AppColor.primary,
              padding: EdgeInsets.symmetric(vertical: 18),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
