import 'package:get/get.dart';

import '../controllers/upadate_controller.dart';

class UpadateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UpadateController>(
      () => UpadateController(),
    );
  }
}
