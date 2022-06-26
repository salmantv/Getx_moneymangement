import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:levy/app/Model/Categroy_Model/catagroy_model.dart';

import '../../../Model/Translation_model/translation_model.dart';
import '../../globealVaribles/globle.dart';

class HomeController extends GetxController {
  @override
  void onInit() async {
    super.onInit();
    await refrsh();
    await math(homecontroller.transltionsnotfier);
  }

  List<TranclationModel> transltionsnotfier = [];
  List<TranclationModel> todaynotfier = [];
  List<TranclationModel> yesterdaynotfier = [];
  List<TranclationModel> incomenotfiere = [];
  List<TranclationModel> expansenotfiere = [];
  List<TranclationModel> testingnotfiere = [];
  List<TranclationModel> monthnotfier = [];

  math(value) {
    toteltracstion = 0;
    totelincome = 0;
    totelexpanse = 0;
    for (var element in homecontroller.transltionsnotfier) {
      if (element.categorytyp == categorytype.income &&
          element.datetime.month == DateTime.now().month) {
        totelincome += element.amount;
      }
      if (element.categorytyp == categorytype.expanse &&
          element.datetime.month == DateTime.now().month) {
        totelexpanse += element.amount;
      }
    }
    toteltracstion = totelincome - totelexpanse;
    update();
  }

  Future refrsh() async {
    todaynotfier.clear();
    yesterdaynotfier.clear();
    final _alllist = await gettranction();

    Future.forEach(_alllist, (TranclationModel element) {
      if (element.amount == 0.0) {
        deleteingTrastions(element);
      }
    });

    Future.forEach(_alllist, (TranclationModel element) {
      if (element.datetime.day == DateTime.now().day) {
        todaynotfier.add(element);
      } else if (element.datetime.day == DateTime.now().day - 1 &&
          element.datetime.month == DateTime.now().month) {
        yesterdaynotfier.add(element);
      } else if (element.categorytyp == categorytype.income) {}
    });

    incomenotfiere.clear();
    expansenotfiere.clear();
    Future.forEach(_alllist, (TranclationModel element) {
      if (element.categorytyp == categorytype.income) {
        incomenotfiere.add(element);
      } else {
        expansenotfiere.add(element);
      }
      update();
    });

    testingnotfiere.toSet().toList().clear();
    Future.forEach(_alllist, (TranclationModel element) {});
    transltionsnotfier.clear();
    transltionsnotfier.addAll(_alllist);
    homecontroller.onInit();
  }

  Future<void> addtransltion(TranclationModel value) async {
    final _db = await Hive.openBox<TranclationModel>("transltion_db_open");
    _db.put(value.id, value);
    refrsh();
  }

  Future<List<TranclationModel>> gettranction() async {
    final _db = await Hive.openBox<TranclationModel>("transltion_db_open");
    return _db.values.toSet().toList();
  }

  // ignore: non_constant_identifier_names
  Future<void> deleteingTrastions(TranclationModel Id) async {
    final _db = await Hive.openBox<TranclationModel>("transltion_db_open");
    _db.delete(Id.id);
    refrsh();
  }

  Future<void> upadating(TranclationModel data) async {
    final _db = await Hive.openBox<TranclationModel>("transltion_db_open");
    _db.put(data.id, data);
    refrsh();
    homecontroller.onInit();
  }

  // ignore: non_constant_identifier_names
  Future<void> Claredata() async {
    final _db = await Hive.openBox<TranclationModel>("transltion_db_open");
    _db.clear();
    homecontroller.onInit();
  }
}
