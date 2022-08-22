import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:game_islami/app/routes/app_pages.dart';
import 'package:game_islami/app/style/app_color.dart';
import 'package:game_islami/app/widgets/challenge_tile.dart';
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
                  StreamBuilder<QuerySnapshot>(
                    stream: controller.getChallanges(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) return Text('errr');
                      if (snapshot.connectionState == ConnectionState.waiting) return Text('loading');
                      return ListView(
                        shrinkWrap: true,
                        padding: EdgeInsets.symmetric(vertical: 16),
                        physics: NeverScrollableScrollPhysics(),
                        children: snapshot.data!.docs.map((QueryDocumentSnapshot document) {
                          Map<String, dynamic> challengeData = document.data()! as Map<String, dynamic>;
                          print(challengeData);
                          double progressValue = challengeData['amount'] / challengeData['limit'];
                          if (progressValue >= 1.0) progressValue = 1.0;
                          return ChallengeTile(
                            progressTitle: Text(
                              "${challengeData['amount']}/${challengeData['limit']}",
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'poppins',
                              ),
                            ),
                            progressValue: progressValue,
                            title: "${challengeData['name']}",
                            subtitle: "hadiah ${challengeData['reward']} pahala",
                            margin: EdgeInsets.only(bottom: 16),
                          );
                        }).toList(),
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
