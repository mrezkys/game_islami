import 'package:game_islami/app/data/models/surah_model.dart';
import 'package:game_islami/app/data/providers/surah_provider.dart';
import 'package:get/get.dart';

class PilihSurahController extends GetxController {
  SurahProvider surahProvider = SurahProvider();
  late Future<List<Surah>> listSurah;

  initApp() {
    listSurah = surahProvider.getAllSurah();
  }

  @override
  void onInit() {
    super.onInit();
    initApp();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
