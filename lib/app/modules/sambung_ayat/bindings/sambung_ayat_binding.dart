import 'package:get/get.dart';

import '../controllers/sambung_ayat_controller.dart';

class SambungAyatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SambungAyatController>(
      () => SambungAyatController(),
    );
  }
}
