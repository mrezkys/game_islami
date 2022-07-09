import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:game_islami/app/controllers/main_bottom_navigation_bar_controller.dart';
import 'package:get/get.dart';

class MainBottomNavigationBar extends GetView<MainBottomNavigationBarController> {
  const MainBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      currentIndex: controller.pageIndex.value,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      onTap: controller.changePage,
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset((controller.pageIndex.value == 0) ? 'assets/icons/home.svg' : 'assets/icons/home-outline.svg'),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset((controller.pageIndex.value == 1) ? 'assets/icons/star.svg' : 'assets/icons/star-outline.svg'),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset((controller.pageIndex.value == 2) ? 'assets/icons/profile.svg' : 'assets/icons/profile-outline.svg'),
          label: '',
        ),
      ],
    );
  }
}
