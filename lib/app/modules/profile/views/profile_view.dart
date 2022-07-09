import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:game_islami/app/style/app_color.dart';
import 'package:game_islami/app/widgets/info_card.dart';
import 'package:game_islami/app/widgets/main_bottom_navigation_bar.dart';
import 'package:game_islami/app/widgets/menu_button.dart';

import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
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
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 20),
              color: AppColor.secondary,
              child: Column(
                children: [
                  Text(
                    "👋 Hi Rezky,",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      fontFamily: 'poppins',
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "selamat datang!",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'poppins',
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 16),
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppColor.secondaryLight,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        InfoCard(
                          value: 2000,
                          title: 'Pahala',
                          icon: SvgPicture.asset('assets/icons/star.svg'),
                        ),
                        InfoCard(
                          value: 23,
                          title: 'Urutan Alim',
                          icon: SvgPicture.asset('assets/icons/profile-bulk.svg'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Section 2 - Menu
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: Column(
                children: [
                  MenuButton(
                    title: "Tukar Pahala",
                    onTap: () {},
                    backgroundColor: AppColor.secondary,
                    titleColor: Colors.white,
                    borderColor: AppColor.secondary,
                    suffixIcon: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: AppColor.grey,
                    ),
                  ),
                  SizedBox(height: 16),
                  MenuButton(
                    title: "Perbarui Profil",
                    onTap: () {},
                    suffixIcon: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: AppColor.grey,
                    ),
                  ),
                  SizedBox(height: 16),
                  MenuButton(
                    title: "Ganti Password",
                    onTap: () {},
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
                    onTap: () {},
                    suffixIcon: SvgPicture.asset('assets/icons/logout.svg'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
