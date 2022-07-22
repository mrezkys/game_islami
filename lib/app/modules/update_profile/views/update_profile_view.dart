import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:game_islami/app/modules/update_profile/views/link_account_view.dart';
import 'package:game_islami/app/style/app_color.dart';
import 'package:game_islami/app/widgets/custom_input.dart';

import 'package:get/get.dart';

import '../controllers/update_profile_controller.dart';

class UpdateProfileView extends GetView<UpdateProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Perbarui Profil',
          style: TextStyle(fontSize: 14),
        ),
        centerTitle: true,
        backgroundColor: AppColor.secondary,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: SvgPicture.asset('assets/icons/arrow-left.svg'),
        ),
      ),
      body: (controller.checkIsAnonymous())
          ? LinkAccountView()
          : ListView(
              shrinkWrap: true,
              children: [
                CustomInput(
                  margin: EdgeInsets.only(left: 16, right: 16, top: 24, bottom: 16),
                  controller: controller.nameC,
                  label: 'nama pengguna',
                  hint: 'namu kamu',
                  hintColor: AppColor.secondary.withOpacity(0.5),
                ),
                CustomInput(
                  disabled: true,
                  margin: EdgeInsets.only(left: 16, right: 16),
                  controller: controller.emailC,
                  label: 'email',
                  hint: 'emailkamu@email.com',
                  hintColor: AppColor.secondary.withOpacity(0.5),
                ),
                Container(
                  margin: EdgeInsets.only(left: 18, top: 18, bottom: 16),
                  child: Row(
                    children: [
                      Text(
                        'Ganti Password',
                        style: TextStyle(
                          color: AppColor.secondary.withOpacity(0.8),
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        ' *jika ingin mengubah',
                        style: TextStyle(
                          color: AppColor.danger,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ),
                Obx(
                  () => CustomInput(
                    margin: EdgeInsets.only(left: 16, right: 16, bottom: 24),
                    controller: controller.currentPassC,
                    label: 'password saat ini',
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
                      controller.updateProfile();
                    },
                    child: Text(
                      'Perbarui',
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
            ),
    );
  }
}
