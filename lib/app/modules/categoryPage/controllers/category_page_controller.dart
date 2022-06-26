import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:levy/app/modules/globealVaribles/globle.dart';

import '../../../Model/Categroy_Model/catagroy_model.dart';

class CategoryPageController extends GetxController {
  @override
  void onInit() async {
    super.onInit();
    await refershUi();
  }

  String CATEGORY_DB_NAME = 'category_database';
  List<CategoryModel> incomeCategory = [];
  List<CategoryModel> expanseCategory = [];

  @override
  Future<void> insertcatgory(CategoryModel value) async {
    final _categoryDB = await Hive.openBox<CategoryModel>(CATEGORY_DB_NAME);
    _categoryDB.put(value.id, value);
    refershUi();
  }

  @override
  Future<List<CategoryModel>> getcategory() async {
    final _categoryDB = await Hive.openBox<CategoryModel>(CATEGORY_DB_NAME);
    return _categoryDB.values.toList();
  }

  Future<void> refershUi() async {
    incomeCategory.clear();
    expanseCategory.clear();
    final allcategory = await getcategory();
    Future.forEach(allcategory, (CategoryModel category) {
      if (category.categorytype == categorytype.income) {
        incomeCategory.add(category);
      } else {
        expanseCategory.add(category);
      }
      update();
    });
  }

  @override
  Future<void> deletecategory(String deletaId) async {
    final _categoryDB = await Hive.openBox<CategoryModel>(CATEGORY_DB_NAME);
    _categoryDB.delete(deletaId);
    refershUi();
  }

  Future<void> deletealldatafromedatabase() async {
    final _categoryDB = await Hive.openBox<CategoryModel>(CATEGORY_DB_NAME);
    _categoryDB.clear();
  }
}
