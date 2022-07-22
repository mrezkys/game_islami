import 'package:get/get.dart';

import 'package:game_islami/app/modules/home/bindings/home_binding.dart';
import 'package:game_islami/app/modules/home/views/home_view.dart';
import 'package:game_islami/app/modules/login/bindings/login_binding.dart';
import 'package:game_islami/app/modules/login/views/login_view.dart';
import 'package:game_islami/app/modules/pilih_surah/bindings/pilih_surah_binding.dart';
import 'package:game_islami/app/modules/pilih_surah/views/pilih_surah_view.dart';
import 'package:game_islami/app/modules/profile/bindings/profile_binding.dart';
import 'package:game_islami/app/modules/profile/views/profile_view.dart';
import 'package:game_islami/app/modules/rank/bindings/rank_binding.dart';
import 'package:game_islami/app/modules/rank/views/rank_view.dart';
import 'package:game_islami/app/modules/register/bindings/register_binding.dart';
import 'package:game_islami/app/modules/register/views/register_view.dart';
import 'package:game_islami/app/modules/sambung_ayat/bindings/sambung_ayat_binding.dart';
import 'package:game_islami/app/modules/sambung_ayat/views/sambung_ayat_view.dart';
import 'package:game_islami/app/modules/sambung_ayat_game/bindings/sambung_ayat_game_binding.dart';
import 'package:game_islami/app/modules/sambung_ayat_game/views/sambung_ayat_game_view.dart';
import 'package:game_islami/app/modules/tebak_surah/bindings/tebak_surah_binding.dart';
import 'package:game_islami/app/modules/tebak_surah/views/tebak_surah_view.dart';
import 'package:game_islami/app/modules/tebak_surah_game/bindings/tebak_surah_game_binding.dart';
import 'package:game_islami/app/modules/tebak_surah_game/views/tebak_surah_game_view.dart';
import 'package:game_islami/app/modules/update_profile/bindings/update_profile_binding.dart';
import 'package:game_islami/app/modules/update_profile/views/update_profile_view.dart';

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
    GetPage(
      name: _Paths.SAMBUNG_AYAT,
      page: () => SambungAyatView(),
      binding: SambungAyatBinding(),
    ),
    GetPage(
      name: _Paths.TEBAK_SURAH,
      page: () => TebakSurahView(),
      binding: TebakSurahBinding(),
    ),
    GetPage(
      name: _Paths.SAMBUNG_AYAT_GAME,
      page: () => SambungAyatGameView(),
      binding: SambungAyatGameBinding(),
    ),
    GetPage(
      name: _Paths.PILIH_SURAH,
      page: () => PilihSurahView(),
      binding: PilihSurahBinding(),
    ),
    GetPage(
      name: _Paths.TEBAK_SURAH_GAME,
      page: () => TebakSurahGameView(),
      binding: TebakSurahGameBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.UPDATE_PROFILE,
      page: () => UpdateProfileView(),
      binding: UpdateProfileBinding(),
    ),
  ];
}
