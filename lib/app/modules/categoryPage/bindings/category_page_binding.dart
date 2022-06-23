import 'package:get/get.dart';

import '../controllers/category_page_controller.dart';

class CategoryPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CategoryPageController>(
      () => CategoryPageController(),
    );
  }
}
