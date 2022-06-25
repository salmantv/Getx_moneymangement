import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:levy/app/Model/Categroy_Model/catagroy_model.dart';
import 'package:levy/app/modules/globealVaribles/globle.dart';

import '../../../Model/Translation_model/translation_model.dart';

import '../../categoryPage/controllers/category_page_controller.dart';
import '../../home/controllers/home_controller.dart';

class AddingDataController extends GetxController {
  final homecontroller = Get.put(HomeController());

  DateTime? selecteddate;
  final dateshowing = TextEditingController();
  final monthshwing = TextEditingController();
  final amountcondroller = TextEditingController();
  final notescondroller = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    nowcategory = categorytype.income;
    dateshowing.text = DateTime.now().day.toString();
    monthshwing.text = monthnames[DateTime.now().month - 1];
    selecteddate = DateTime.now();
  }

  final controller = Get.put(CategoryPageController());

  checking() {
    if (nowcategory == categorytype.income) {
      controller.incomeCategory;
      return controller.incomeCategory;
    } else {
      controller.expanseCategory;
      return controller.expanseCategory;
    }
  }

  void radioButtonWorking(radiobutton) {
    if (radiobutton == "Income") {
      selectedcategory = null;
      categoryshow.text = '';
      nowcategory = categorytype.income;
    } else {
      categoryshow.text = '';
      selectedcategory = null;
      nowcategory = categorytype.expanse;
    }
  }

  Future<void> monthepicker(context) async {
    await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime.now().subtract(const Duration(days: 365)),
            lastDate: DateTime.now())
        .then((value) {
      dateshowing.text = value!.day.toString();
      monthshwing.text = monthnames[value.month - 1];
      selecteddate = value;
    });
    update();
  }

  Future<void> transltionsadding() async {
    double amoutparsed = double.tryParse(amountcondroller.text) ?? 0;

    if (selectedcategory == null) {
      return;
    }

    if (selecteddate == null) {
      return;
    }

    final value = TranclationModel(
        catagry: selectedcategory!,
        amount: amoutparsed,
        categorytyp: nowcategory!,
        datetime: selecteddate!,
        not: notescondroller.text == "" ? 'Note : empty' : notescondroller.text,
        id: DateTime.now().microsecondsSinceEpoch.toString());
    homecontroller.addtransltion(value);
    update();
  }
}
