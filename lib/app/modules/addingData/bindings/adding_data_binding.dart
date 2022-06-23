import 'package:get/get.dart';

import '../controllers/adding_data_controller.dart';

class AddingDataBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddingDataController>(
      () => AddingDataController(),
    );
  }
}
