import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:game_islami/app/routes/app_pages.dart';
import 'package:game_islami/app/style/app_color.dart';
import 'package:game_islami/app/widgets/challenge_tile.dart';
import 'package:game_islami/app/widgets/info_card.dart';
import 'package:game_islami/app/widgets/main_bottom_navigation_bar.dart';
import 'package:game_islami/app/widgets/main_button.dart';
import 'package:game_islami/app/widgets/user_info.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: MainBottomNavigationBar(),
        body: ListView(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          children: [
            // Section 1 - Header
            UserInfo(),
            // Section 2 - Game
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Mulai bermain',
                    style: TextStyle(
                      color: AppColor.secondary.withOpacity(0.8),
                      fontSize: 12,
                    ),
                  ),
                  MainButton(
                    margin: EdgeInsets.only(top: 16),
                    title: "Tebak Surah",
                    backgroundColor: AppColor.secondary,
                    titleColor: Colors.white,
                    iconColor: Colors.white.withOpacity(0.5),
                    onTap: () {
                      Get.toNamed(Routes.TEBAK_SURAH);
                    },
                  ),
                  MainButton(
                    margin: EdgeInsets.only(top: 16),
                    title: "Sambung Ayat",
                    backgroundColor: AppColor.secondary,
                    titleColor: Colors.white,
                    iconColor: Colors.white.withOpacity(0.5),
                    onTap: () {
                      Get.toNamed(Routes.SAMBUNG_AYAT);
                    },
                  ),
                ],
              ),
            ),
            // Section 3 - Challenge
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tantangan Harian',
                    style: TextStyle(
                      color: AppColor.secondary.withOpacity(0.8),
                      fontSize: 12,
                    ),
                  ),
                  ListView.separated(
                    itemCount: 3,
                    shrinkWrap: true,
                    padding: EdgeInsets.symmetric(vertical: 16),
                    physics: NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, index) => SizedBox(height: 16),
                    itemBuilder: (context, index) {
                      return ChallengeTile(
                        progressTitle: Text(
                          "7/10",
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'poppins',
                          ),
                        ),
                        progressValue: 0.8,
                        title: "Tebak 10 Surah",
                        subtitle: "hadiah 1000 pahala",
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
