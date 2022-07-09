import 'package:get/get.dart';

import 'package:game_islami/app/modules/home/bindings/home_binding.dart';
import 'package:game_islami/app/modules/home/views/home_view.dart';
import 'package:game_islami/app/modules/profile/bindings/profile_binding.dart';
import 'package:game_islami/app/modules/profile/views/profile_view.dart';
import 'package:game_islami/app/modules/rank/bindings/rank_binding.dart';
import 'package:game_islami/app/modules/rank/views/rank_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 300),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 300),
    ),
    GetPage(
      name: _Paths.RANK,
      page: () => RankView(),
      binding: RankBinding(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 300),
    ),
  ];
}
