import 'package:get/get.dart';

import '../controllers/pilih_surah_controller.dart';

class PilihSurahBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PilihSurahController>(
      () => PilihSurahController(),
    );
  }
}
