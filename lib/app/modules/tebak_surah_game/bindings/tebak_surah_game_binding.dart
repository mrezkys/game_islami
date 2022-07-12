import 'package:get/get.dart';

import '../controllers/tebak_surah_game_controller.dart';

class TebakSurahGameBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TebakSurahGameController>(
      () => TebakSurahGameController(),
    );
  }
}
