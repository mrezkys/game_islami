import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:game_islami/app/controllers/loading_controller.dart';
import 'package:game_islami/app/controllers/main_bottom_navigation_bar_controller.dart';
import 'package:game_islami/app/controllers/user_info_controller.dart';
import 'package:game_islami/app/style/app_color.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:game_islami/app/widgets/loading_screen.dart';
import 'firebase_options.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Get.put(MainBottomNavigationBarController());
  Get.put(LoadingController());
  Get.put(UserInfoController());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: AppColor.secondary,
    statusBarBrightness: Brightness.dark,
  ));
  runApp(
    StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return MaterialApp(
              home: LoadingScreen(
                loadingBackgroundColor: AppColor.secondaryLight,
                circularProgressColor: AppColor.primary,
              ),
            );
          }
          return GetMaterialApp(
            title: "Application",
            initialRoute: snapshot.data != null ? Routes.HOME : Routes.LOGIN,
            getPages: AppPages.routes,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              fontFamily: 'inter',
              scaffoldBackgroundColor: Colors.white,
              textTheme: TextTheme().apply(
                bodyColor: AppColor.secondary,
                displayColor: AppColor.secondary,
              ),
            ),
          );
        }),
  );
}
