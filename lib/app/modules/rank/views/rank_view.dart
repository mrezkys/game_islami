import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:game_islami/app/style/app_color.dart';
import 'package:game_islami/app/widgets/info_card.dart';
import 'package:game_islami/app/widgets/main_bottom_navigation_bar.dart';

import 'package:get/get.dart';

import '../controllers/rank_controller.dart';

class RankView extends GetView<RankController> {
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
            // Section 2 - Ranking
            ListView.separated(
              shrinkWrap: true,
              itemCount: 3,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              separatorBuilder: (context, index) => SizedBox(height: 16),
              itemBuilder: (context, index) {
                return RankTile(
                  ranking: index + 1,
                  isBig3: true,
                  name: "Muhammad Rezky Sulihin",
                  point: 2000,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class RankTile extends StatelessWidget {
  final int ranking;
  final String name;
  final int point;
  final bool isBig3;

  RankTile({
    required this.ranking,
    required this.name,
    required this.point,
    required this.isBig3,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColor.grey, width: 1),
      ),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            margin: EdgeInsets.only(right: 16),
            alignment: Alignment.center,
            child: Stack(
              children: [
                Visibility(
                  visible: isBig3,
                  child: SvgPicture.asset(
                    'assets/icons/star-outline.svg',
                    width: 42,
                    height: 42,
                  ),
                ),
                Center(
                  child: Text(
                    "$ranking",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "$name",
                style: TextStyle(
                  fontFamily: 'poppins',
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 4),
              Text(
                "$point Pahala",
                style: TextStyle(fontSize: 12),
              )
            ],
          )
        ],
      ),
    );
  }
}
