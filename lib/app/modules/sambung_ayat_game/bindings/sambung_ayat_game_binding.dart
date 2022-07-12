import 'package:get/get.dart';

import '../controllers/sambung_ayat_game_controller.dart';

class SambungAyatGameBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SambungAyatGameController>(
      () => SambungAyatGameController(),
    );
  }
}
