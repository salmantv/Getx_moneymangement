import 'package:get/get.dart';

class ButtonnavigationController extends GetxController {
  int updatedvalue = 0;

  buttonnavigationcontroll(index) {
    updatedvalue = index;
    update();
  }
}
