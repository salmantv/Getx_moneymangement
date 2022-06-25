import 'package:get/get.dart';

import '../controllers/seeall_controller.dart';

class SeeallBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SeeallController>(
      () => SeeallController(),
    );
  }
}
