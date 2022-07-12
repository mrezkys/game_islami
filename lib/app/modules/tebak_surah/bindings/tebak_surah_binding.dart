import 'package:get/get.dart';

import '../controllers/tebak_surah_controller.dart';

class TebakSurahBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TebakSurahController>(
      () => TebakSurahController(),
    );
  }
}
