import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:game_islami/app/controllers/main_bottom_navigation_bar_controller.dart';
import 'package:game_islami/app/style/app_color.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(MainBottomNavigationBarController());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: AppColor.secondary,
    statusBarBrightness: Brightness.dark,
  ));
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'inter',
        scaffoldBackgroundColor: Colors.white,
      ),
    ),
  );
}
