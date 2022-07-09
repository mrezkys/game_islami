import 'package:game_islami/app/routes/app_pages.dart';
import 'package:get/get.dart';

class MainBottomNavigationBarController extends GetxController {
  RxInt pageIndex = 0.obs;

  void changePage(int index) {
    pageIndex.value = index;
    switch (index) {
      case 1:
        Get.offAllNamed(Routes.RANK);
        break;
      case 2:
        Get.offAllNamed(Routes.PROFILE);
        break;
      default:
        Get.offAllNamed(Routes.HOME);
        break;
    }
  }
}
