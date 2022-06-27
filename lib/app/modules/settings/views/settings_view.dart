import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:levy/app/modules/categoryPage/controllers/category_page_controller.dart';
import 'package:levy/app/modules/home/controllers/home_controller.dart';
import 'package:levy/app/modules/settings/controllers/settings_controller.dart';
import 'package:levy/app/modules/settings/views/widgets/listTiile.dart';
import 'package:levy/app/modules/settings/views/widgets/notication.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../icons/myicons.dart';
import '../../globealVaribles/globle.dart';
import '../../splash/views/splash_view.dart';

class SettingsView extends StatelessWidget {
  SettingsView({Key? key}) : super(key: key);

  void listenNotifications() {
    NotificationApi.onNotifications.listen(onClickNotifications);
  }

  final home = Get.put(HomeController());
  final category = Get.put(CategoryPageController());
  final setting = Get.put(SettingsController());

  onClickNotifications(String? payload) {
    Get.to(SecondScreen());
    return null;
  }

  @override
  Widget build(BuildContext context) {
    NotificationApi().init(initScheduled: true); // instate

    return WillPopScope(
      onWillPop: () async {
        final deffent = DateTime.now().difference(pressedtime);
        final isExieit = deffent >= const Duration(seconds: 2);
        pressedtime = DateTime.now();

        if (isExieit) {
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          child: Center(
              child: ListView(
            children: [
              SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 50,
                child: const Center(
                  child: Text(
                    "Settings",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 20,
                        fontFamily: "HKGrotesk"),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setting.timePicking(context: context);
                },
                child: MylistTile(
                  icon: MyFlutterApp.alarm,
                  name: 'Notification',
                ),
              ),
              MylistTile(
                icon: MyFlutterApp.link,
                name: 'Share the app',
              ),
              GestureDetector(
                onTap: () async {
                  if (!await launch(
                      'mailto: salmanthaniveappil@gmail.com?subject= &body= Write Your feeback Suggesions etc ............. '
                      '')) {
                    throw 'Could not launch ';
                  }
                },
                child: MylistTile(
                  icon: MyFlutterApp.user_1,
                  name: 'Contact us',
                ),
              ),
              InkWell(
                onTap: () {
                  setting.restalldata(
                    context,
                    "Rest Data",
                  );
                },
                child: MylistTile(
                  icon: MyFlutterApp.undo,
                  name: 'Reset app',
                ),
              ),
              GestureDetector(
                onTap: () async {
                  // ignore: deprecated_member_use
                  if (!await launch(
                      'https://salmantv.github.io/Salman.com/#')) {
                    throw 'Could not launch ';
                  }
                },
                child: MylistTile(
                  icon: MyFlutterApp.envelope,
                  name: 'About me',
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
