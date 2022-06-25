import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:levy/app/Model/Categroy_Model/catagroy_model.dart';
import 'package:levy/app/Model/Translation_model/translation_model.dart';
import 'package:levy/app/modules/home/controllers/home_controller.dart';

import '../../categoryPage/controllers/category_page_controller.dart';
import '../../globealVaribles/globle.dart';

class UpadateController extends GetxController {
  final oldcategory = TextEditingController();
  final dateshowing = TextEditingController();
  final monthshwing = TextEditingController();
  final oldamount = TextEditingController();
  final oldnot = TextEditingController();
  final home = Get.put(HomeController());

  DateTime? selecteddate;

  void montheUpadted(CategoryModel category) {
    oldcategory.text = category.name;
    selectedcategory = category;
    update();
  }

  Future<void> transltionsadding(TranclationModel Data) async {
    final _amoutparsed = double.parse(oldamount.text);

    final value = TranclationModel(
        catagry: selectedcategory ?? Data.catagry,
        amount: _amoutparsed,
        categorytyp: nowcategory ?? Data.categorytyp,
        datetime: selecteddate ?? Data.datetime,
        not: oldnot.text,
        id: Data.id.toString());
    update();
    home.upadating(value);
  }

  Future<void> monthUpadating(context) async {
    await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime.now().subtract(const Duration(days: 365)),
            lastDate: DateTime.now())
        .then((value) {
      dateshowing.text = value!.day.toString();
      monthshwing.text = monthnames[value.month - 1];
      selecteddate = value;
      update();
    });
  }

  final category = Get.put(CategoryPageController());
  List<CategoryModel> buttomsheetworkes(TranclationModel value) {
    if (value.categorytyp == categorytype.income) {
      return category.incomeCategory;
    } else {
      return category.expanseCategory;
    }
  }
}
