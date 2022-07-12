import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:game_islami/app/routes/app_pages.dart';
import 'package:game_islami/app/style/app_color.dart';
import 'package:game_islami/app/widgets/main_button.dart';

import 'package:get/get.dart';

import '../controllers/sambung_ayat_controller.dart';

class SambungAyatView extends GetView<SambungAyatController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.secondary,
      appBar: AppBar(
        backgroundColor: AppColor.secondary,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: SvgPicture.asset('assets/icons/arrow-left.svg'),
        ),
        centerTitle: true,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              height: 352,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(left: 16, right: 16, top: 130),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  Text(
                    "Sambung Ayat",
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontFamily: 'poppins',
                      fontSize: 24,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 16),
                    child: Text(
                      "Game sambung ayat adalah game dimana kamu akan menebak ayat selanjutnya dari ayat yang ditampilkan. Kamu dapat memilih surahnya atau langsung mengacak surah.",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        color: AppColor.secondary.withOpacity(0.7),
                        height: 150 / 100,
                      ),
                    ),
                  ),
                  // Button
                  MainButton(
                    margin: EdgeInsets.only(top: 32),
                    title: "Acak Surah",
                    backgroundColor: AppColor.primary,
                    titleColor: AppColor.secondary,
                    iconColor: AppColor.secondary.withOpacity(0.5),
                    onTap: () {
                      Get.toNamed(Routes.SAMBUNG_AYAT_GAME);
                    },
                  ),
                  MainButton(
                    margin: EdgeInsets.only(top: 16),
                    title: "Pilih Surah",
                    backgroundColor: AppColor.secondary,
                    titleColor: Colors.white,
                    iconColor: Colors.white.withOpacity(0.5),
                    onTap: () {
                      Get.toNamed(Routes.PILIH_SURAH);
                    },
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: 148,
                margin: EdgeInsets.only(top: 18),
                child: SvgPicture.asset('assets/icons/alquran.svg'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
