import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:levy/app/modules/buttonnavigation/controllers/buttonnavigation_controller.dart';

import '../../../../icons/myicons.dart';

// ignore: must_be_immutable
class ButtonnavigationView extends StatelessWidget {
  const ButtonnavigationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final getcontroller = Get.put(ButtonnavigationController());
    return SizedBox(
      height: 70,
      child: GetBuilder<ButtonnavigationController>(
        builder: (GetxController controller) {
          return BottomNavigationBar(
              backgroundColor: Colors.white,
              type: BottomNavigationBarType.fixed, // This is all you need!
              currentIndex: getcontroller.updatedvalue,
              fixedColor: Colors.black,
              onTap: (index) {
                getcontroller.buttonnavigationcontroll(index);
              },
              items: const [
                BottomNavigationBarItem(
                    activeIcon: Icon(
                      MyFlutterApp.home,
                      size: 28,
                    ),
                    icon: Icon(MyFlutterApp.home),
                    label: "",
                    backgroundColor: Color.fromARGB(255, 255, 255, 255)),
                BottomNavigationBarItem(
                    activeIcon: Icon(
                      MyFlutterApp.pie_chart,
                      size: 28,
                    ),
                    icon: Icon(MyFlutterApp.pie_chart),
                    label: "",
                    backgroundColor: Color.fromARGB(255, 255, 255, 255)),
                BottomNavigationBarItem(
                    activeIcon: Icon(
                      MyFlutterApp.chart_bars,
                      size: 28,
                    ),
                    icon: Icon(
                      MyFlutterApp.chart_bars,
                    ),
                    label: ""),
                BottomNavigationBarItem(
                    activeIcon: Icon(
                      MyFlutterApp.cog_1,
                      size: 28,
                    ),
                    icon: Icon(
                      MyFlutterApp.cog_1,
                    ),
                    label: ""),
              ]);
        },
      ),
    );
  }
}
