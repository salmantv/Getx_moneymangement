import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:levy/app/modules/categoryPage/controllers/category_page_controller.dart';
import 'package:levy/app/modules/home/controllers/home_controller.dart';
import 'package:levy/app/modules/home/views/home_view.dart';
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
          backexitsnackbar(context);
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
                height: 20,
              ),
              SizedBox(
                height: 20,
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
                  timePicking(context: context);
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
                  restalldata(
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

  timePicking({required context}) async {
    final TimeOfDay? pickedTIme = await showTimePicker(
      initialEntryMode: TimePickerEntryMode.dial,
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTIme != null && pickedTIme != TimeOfDay.now()) {
      // setState(() {
      NotificationApi.showScheduledNotifications(
          title: "Levy",
          body:
              "⏳ Hi I thing We miss to add new transaction  🕥 And click the notfiaction and add   📅  ",
          scheduledTime: Time(pickedTIme.hour, pickedTIme.minute, 0));
      // });
    }
  }

  backexitsnackbar(context) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        duration: Duration(seconds: 2),
        backgroundColor: Color.fromARGB(255, 66, 66, 66),
        content: Text(" Press back again to exite ")));
  }

  Future<void> restalldata(
    BuildContext context,
    String titel,
  ) async {
    showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          content: SizedBox(
            height: 100,
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                const Text("All of this applications data will be deleted "
                    "Permanently . This includes all files ,settings , transaction , also data base.")
              ],
            ),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("Cancel")),
            TextButton(
                onPressed: () async {
                  await setting.restingapp();
                  homecontroller.update();
                  // setState(() {});
                },
                child: const Text("Accept"))
          ],
        );
      },
    );
  }
}
