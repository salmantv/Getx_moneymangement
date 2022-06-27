import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:levy/app/modules/settings/views/widgets/notication.dart';

import '../../categoryPage/controllers/category_page_controller.dart';
import '../../home/controllers/home_controller.dart';
import '../../splash/views/splash_view.dart';

class SettingsController extends GetxController {
  final home = Get.put(HomeController());
  final category = Get.put(CategoryPageController());
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
                  await restingapp();
                  Get.to(SecondScreen());
                },
                child: const Text("Accept"))
          ],
        );
      },
    );
  }

  restingapp() async {
    await home.Claredata();
    await category.deletealldatafromedatabase();
  }

  timePicking({required context}) async {
    final TimeOfDay? pickedTIme = await showTimePicker(
      initialEntryMode: TimePickerEntryMode.dial,
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTIme != null && pickedTIme != TimeOfDay.now()) {
      NotificationApi.showScheduledNotifications(
          title: "Levy",
          body:
              "⏳ Hi I thing We miss to add new transaction  🕥 And click the notfiaction and add   📅  ",
          scheduledTime: Time(pickedTIme.hour, pickedTIme.minute, 0));
      update();
    }
  }
}
