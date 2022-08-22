import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:game_islami/app/style/app_color.dart';
import 'package:game_islami/app/widgets/custom_input.dart';

import 'package:get/get.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.secondary,
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 42),
                  child: SizedBox(
                    child: SvgPicture.asset('assets/icons/logo.svg'),
                  ),
                ),
              ),
              CustomInput(
                controller: controller.nameC,
                label: 'nama',
                hint: 'Abdullah',
                borderColor: AppColor.secondaryLight,
                labelColor: Colors.white,
                textColor: Colors.white,
                hintColor: Colors.white.withOpacity(0.5),
              ),
              CustomInput(
                controller: controller.emailC,
                label: 'email',
                hint: 'emailkamu@email.com',
                borderColor: AppColor.secondaryLight,
                labelColor: Colors.white,
                textColor: Colors.white,
                hintColor: Colors.white.withOpacity(0.5),
              ),
              Obx(
                () => CustomInput(
                  controller: controller.passC,
                  label: 'password',
                  hint: '************',
                  borderColor: AppColor.secondaryLight,
                  labelColor: Colors.white,
                  textColor: Colors.white,
                  hintColor: Colors.white.withOpacity(0.5),
                  obsecureText: controller.obsecureText.value,
                  suffixIcon: IconButton(
                    icon: (controller.obsecureText.value != false)
                        ? Icon(
                            Icons.visibility,
                            color: Colors.white,
                          )
                        : Icon(
                            Icons.visibility_off,
                            color: Colors.white,
                          ),
                    onPressed: () {
                      controller.obsecureText.value = !(controller.obsecureText.value);
                    },
                  ),
                ),
              ),
              Obx(
                () => CustomInput(
                  controller: controller.confirmPassC,
                  label: 'konfirmasi password',
                  hint: '************',
                  borderColor: AppColor.secondaryLight,
                  labelColor: Colors.white,
                  textColor: Colors.white,
                  hintColor: Colors.white.withOpacity(0.5),
                  obsecureText: controller.obsecureText.value,
                  suffixIcon: IconButton(
                    icon: (controller.obsecureText.value != false)
                        ? Icon(
                            Icons.visibility,
                            color: Colors.white,
                          )
                        : Icon(
                            Icons.visibility_off,
                            color: Colors.white,
                          ),
                    onPressed: () {
                      controller.obsecureText.value = !(controller.obsecureText.value);
                    },
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 4),
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () {
                    controller.register();
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
              Container(
                margin: EdgeInsets.symmetric(vertical: 16),
                child: TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  style: TextButton.styleFrom(primary: AppColor.secondaryLight),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'sudah punya akun? ',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.5),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        'Masuk',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () {
                    controller.loginC.loginAnonymously();
                  },
                  child: Text(
                    'Masuk tanpa akun',
                    style: TextStyle(
                      fontFamily: 'poppins',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: AppColor.secondaryLight,
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
        ),
      ),
    );
  }
}
