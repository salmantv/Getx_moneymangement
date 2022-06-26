import 'package:get/get.dart';

import '../../categoryPage/controllers/category_page_controller.dart';
import '../../home/controllers/home_controller.dart';

class SettingsController extends GetxController {
  final home = Get.put(HomeController());
  final category = Get.put(CategoryPageController());

  restingapp() {
    home.Claredata();
    category.deletealldatafromedatabase();
    update();
    // home.onInit();
  }
}
