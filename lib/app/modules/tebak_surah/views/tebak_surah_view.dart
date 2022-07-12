import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:game_islami/app/routes/app_pages.dart';
import 'package:game_islami/app/style/app_color.dart';
import 'package:game_islami/app/widgets/main_button.dart';

import 'package:get/get.dart';

import '../controllers/tebak_surah_controller.dart';

class TebakSurahView extends GetView<TebakSurahController> {
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
              height: 276,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(left: 16, right: 16, top: 156),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  Text(
                    "Tebak Surah",
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontFamily: 'poppins',
                      fontSize: 24,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 16),
                    child: Text(
                      "Game Tebak Surah adalah game dimana kamu diharuskan menebak surah dengan petunjuk sebuah ayat. Ayat tersebut perlu kamu tebak ada pada surah apa di dalam Al-Quran.",
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
                    title: "Mulai Bermain",
                    backgroundColor: AppColor.primary,
                    titleColor: AppColor.secondary,
                    iconColor: AppColor.secondary.withOpacity(0.5),
                    onTap: () {
                      Get.toNamed(Routes.TEBAK_SURAH_GAME);
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
                child: SvgPicture.asset('assets/icons/mosque.svg'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
