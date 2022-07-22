import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:game_islami/app/controllers/user_info_controller.dart';
import 'package:game_islami/app/style/app_color.dart';
import 'package:game_islami/app/widgets/info_card.dart';
import 'package:get/get.dart';

class UserInfo extends GetView<UserInfoController> {
  const UserInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
      stream: controller.streamUser(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.active:
          case ConnectionState.done:
            Map<String, dynamic> user = snapshot.data!.data()!;
            return Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 20),
              color: AppColor.secondary,
              child: Column(
                children: [
                  Text(
                    "👋 Hi ${user['name']},",
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
                          value: user['point'],
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
            );
          case ConnectionState.waiting:
          case ConnectionState.none:
            return Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 20),
              color: AppColor.secondary,
              child: Column(
                children: [
                  Text(
                    "Loading...",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      fontFamily: 'poppins',
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Loading...",
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
                          isLoading: true,
                          value: 2000,
                          title: 'Pahala',
                          icon: SvgPicture.asset('assets/icons/star.svg'),
                        ),
                        InfoCard(
                          isLoading: true,
                          value: 23,
                          title: 'Urutan Alim',
                          icon: SvgPicture.asset('assets/icons/profile-bulk.svg'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
        }
      },
    );
  }
}
