import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:levy/app/modules/commonControll/commonController.dart';
import 'package:levy/app/modules/home/controllers/home_controller.dart';

import '../../../../icons/myicons.dart';
import '../../globealVaribles/globle.dart';

class SeeallController extends GetxController {
  final homecontroll = Get.put(HomeController());
  final commen = Get.put(CommonController());

  @override
  void onInit() {
    super.onInit();
    homecontroll.refrsh();
  }

  void dropeupadete(newValue) {
    dropselectedvalus = newValue.toString();
    update();
  }

  Future controlloptions(context, value) async {
    showModalBottomSheet(
        elevation: 0,
        context: context,
        builder: (cotx) {
          return SizedBox(
              height: 90,
              width: 120,
              child: ListView(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(MyFlutterApp.cross),
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.of(cotx).pop();
                            commen.TransactionDeleting(context, value);
                          },
                          icon: const Icon(MyFlutterApp.trash_1)),
                      IconButton(
                          onPressed: () {
                            nowcategory = null;
                            // Navigator.of(context)
                            //     .push(MaterialPageRoute(builder: (contex) {
                            //   return Update(Data: value);
                            // }));
                          },
                          icon: const Icon(MyFlutterApp.pencil_1)),
                    ],
                  )
                ],
              ));
        });
  }

  chackingdropdown() {
    if (dropselectedvalus == "1") {
      return homecontroll.transltionsnotfier;
    } else if (dropselectedvalus == '2') {
      return homecontroll.todaynotfier;
    } else if (dropselectedvalus == '3') {
      return homecontroll.yesterdaynotfier;
    } else if (dropselectedvalus == '4') {
      return homecontroll.monthnotfier;
    } else if (dropselectedvalus == '5') {
      return homecontroll.incomenotfiere;
    } else if (dropselectedvalus == "6") {
      return homecontroll.expansenotfiere;
    } else {
      return homecontroll.transltionsnotfier;
    }
  }
}
