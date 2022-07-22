import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:game_islami/app/routes/app_pages.dart';
import 'package:game_islami/app/style/app_color.dart';
import 'package:game_islami/app/widgets/info_card.dart';
import 'package:game_islami/app/widgets/main_bottom_navigation_bar.dart';
import 'package:game_islami/app/widgets/menu_button.dart';
import 'package:game_islami/app/widgets/user_info.dart';

import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: MainBottomNavigationBar(),
        body: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
          stream: controller.streamUser(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.active:
              case ConnectionState.done:
                Map<String, dynamic> user = snapshot.data!.data()!;
                return ListView(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  children: [
                    // Section 1 - Header
                    UserInfo(),
                    // Section 2 - Menu
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                      child: Column(
                        children: [
                          // MenuButton(
                          //   title: "Tukar Pahala",
                          //   onTap: () {},
                          //   backgroundColor: AppColor.secondary,
                          //   titleColor: Colors.white,
                          //   borderColor: AppColor.secondary,
                          //   suffixIcon: Icon(
                          //     Icons.arrow_forward_ios_rounded,
                          //     color: AppColor.grey,
                          //   ),
                          // ),
                          MenuButton(
                            title: "Tukar Pahala",
                            onTap: () {},
                            suffixIcon: Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: AppColor.grey,
                            ),
                          ),
                          SizedBox(height: 16),
                          MenuButton(
                            title: "Perbarui Profil",
                            onTap: () {
                              Get.toNamed(
                                Routes.UPDATE_PROFILE,
                                arguments: user,
                              );
                            },
                            suffixIcon: Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: AppColor.grey,
                            ),
                          ),
                          SizedBox(height: 16),
                          MenuButton(
                            title: "Keluar",
                            titleColor: AppColor.danger,
                            borderColor: AppColor.danger,
                            onTap: () {
                              controller.auth.signOut();
                              Get.offAndToNamed(Routes.LOGIN);
                            },
                            suffixIcon: SvgPicture.asset('assets/icons/logout.svg'),
                          ),
                        ],
                      ),
                    )
                  ],
                );
              case ConnectionState.waiting:
              case ConnectionState.none:
                return Text(
                  "Loading...",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    fontFamily: 'poppins',
                    color: Colors.white,
                  ),
                );
            }
          },
        ),
      ),
    );
  }
}
