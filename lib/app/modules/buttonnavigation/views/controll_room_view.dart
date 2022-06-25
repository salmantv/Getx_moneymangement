import 'package:flutter/material.dart';
import 'package:levy/app/modules/addingData/views/adding_data_view.dart';
import 'package:levy/app/modules/buttonnavigation/views/buttonnavigation_view.dart';
import 'package:levy/app/modules/categoryPage/views/category_page_view.dart';
import 'package:levy/app/modules/globealVaribles/globle.dart';
import 'package:levy/app/modules/home/views/home_view.dart';
import 'package:levy/app/modules/settings/views/settings_view.dart';

import '../../statistics/views/statistics_view.dart';
import '../controllers/buttonnavigation_controller.dart';
import 'package:get/get.dart';

class Controll extends StatelessWidget {
  Controll({Key? key}) : super(key: key);

  final pages = [
    HomeView(),
    CategoryPageView(),
    StatisticsView(),
    SettingsView(),
  ];

  DateTime pressedtime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final deffent = DateTime.now().difference(pressedtime);
        final isExieit = deffent >= const Duration(seconds: 2);
        pressedtime = DateTime.now();
        if (isExieit) {
          backexitsnackbar(context);
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
          drawerEnableOpenDragGesture: true,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.white,
              child: const Icon(
                Icons.add,
                color: Colors.black,
              ),
              onPressed: () async {
                nowcategory = null;
                Get.to(AddingDataView());
              }),
          bottomNavigationBar: const ButtonnavigationView(),
          body: GetBuilder<ButtonnavigationController>(
              init: ButtonnavigationController(),
              builder: (controller) {
                return pages[controller.updatedvalue];
              })),
    );
  }

  backexitsnackbar(context) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        duration: Duration(seconds: 2),
        backgroundColor: Color.fromARGB(255, 66, 66, 66),
        content: Text(" Press back again to exite ")));
  }
}
