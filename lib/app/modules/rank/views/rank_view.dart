import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:game_islami/app/data/models/rank.dart';
import 'package:game_islami/app/style/app_color.dart';
import 'package:game_islami/app/widgets/main_bottom_navigation_bar.dart';
import 'package:game_islami/app/widgets/user_info.dart';

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
            UserInfo(),
            // Section 2 - Ranking
            StreamBuilder<QuerySnapshot>(
              stream: controller.getUserData(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text('errr');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text('loading');
                }
                return ListView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.all(16),
                  children: snapshot.data!.docs.map((DocumentSnapshot document) {
                    Map<String, dynamic> userData = document.data()! as Map<String, dynamic>;

                    print('dec : ${userData}');

                    List<QueryDocumentSnapshot<Object?>> listUserData = snapshot.data!.docs;

                    int initRank = 0;
                    Rank rank = controller.getRank(initRank, userData['uid'], listUserData);

                    return RankTile(
                      ranking: rank.number,
                      name: userData['name'],
                      point: userData['point'],
                      isBig3: rank.isBig3,
                      thisUser: rank.thisUser,
                      margin: EdgeInsets.only(bottom: 16),
                    );
                  }).toList(),
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
  final bool thisUser;
  final EdgeInsetsGeometry margin;

  RankTile({
    required this.ranking,
    required this.name,
    required this.point,
    required this.isBig3,
    this.thisUser = false,
    this.margin = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(16),
      margin: margin,
      decoration: BoxDecoration(
        color: (thisUser) ? AppColor.primary : Colors.white,
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
