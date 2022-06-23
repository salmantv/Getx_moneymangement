import 'package:get/get.dart';
import 'package:levy/app/Model/Categroy_Model/catagroy_model.dart';
import 'package:levy/app/modules/globealVaribles/globle.dart';

class AddingDataController extends GetxController {
  //TODO: Implement AddingDataController

  final count = 0.obs;
  @override
  void onInit() {
    nowcategory = categorytype.expanse;
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
