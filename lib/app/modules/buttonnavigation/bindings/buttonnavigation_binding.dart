import 'package:get/get.dart';

import '../controllers/buttonnavigation_controller.dart';

class ButtonnavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ButtonnavigationController>(
      () => ButtonnavigationController(),
    );
  }
}
