import 'package:flutter/material.dart';
import 'package:levy/app/modules/settings/views/widgets/listTiile.dart';
import 'package:sizer/sizer.dart';

import '../../../../icons/myicons.dart';
import '../../splash/views/splash_view.dart';

class SettingsView extends StatelessWidget {
  SettingsView({Key? key}) : super(key: key);

  // @override
  // void initState() {
  //   super.initState();
  //   // NotificationApi().init(initScheduled: true);
  // }

  void listenNotifications() {
    // NotificationApi.onNotifications.listen(onClickNotifications);
  }

  onClickNotifications(String? payload) {
    return null;
  }

  DateTime pressedtime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final deffent = DateTime.now().difference(pressedtime);
        final isExieit = deffent >= const Duration(seconds: 2);
        pressedtime = DateTime.now();

        if (isExieit) {
          // backexitsnackbar();
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
                height: 40,
              ),
              SizedBox(
                height: 70,
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
                  // timePicking(context: context);
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
                  // if (!await launch(
                  //     'mailto: salmanthaniveappil@gmail.com?subject= &body= Write Your feeback Suggesions etc ............. '
                  //     '')) {
                  //   throw 'Could not launch ';
                  // }
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
                  // if (!await launch(
                  //     'https://salmantv.github.io/Salman.com/#')) {
                  //   throw 'Could not launch ';
                  // }
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

  // timePicking({required context}) async {
  //   final TimeOfDay? pickedTIme = await showTimePicker(
  //     initialEntryMode: TimePickerEntryMode.dial,
  //     context: context,
  //     initialTime: TimeOfDay.now(),
  //   );
  //   if (pickedTIme != null && pickedTIme != TimeOfDay.now()) {
  //     setState(() {
  //       NotificationApi.showScheduledNotifications(
  //           title: "Levy",
  //           body:
  //               "⏳ Hi I thing We miss to add new transaction  🕥 And click the notfiaction and add   📅  ",
  //           scheduledTime: Time(pickedTIme.hour, pickedTIme.minute, 0));
  //     });
  //   }
  // }

  // backexitsnackbar() {
  //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
  //       duration: Duration(seconds: 2),
  //       backgroundColor: Color.fromARGB(255, 66, 66, 66),
  //       content: Text(" Press back again to exite ")));
  // }

  Future<void> restalldata(
    BuildContext context,
    String titel,
  ) async {
    showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            content: SizedBox(
              height: 50,
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
                    // await restingapp();
                    // setState(() {});
                    await Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) {
                      return SecondScreen();
                    }), (route) => false);
                  },
                  child: const Text("Accept"))
            ],
          );
        });
  }

  // restingapp() {
  //   Tracnsltion.instense.Claredata();
  //   Categoeydb.instense.deletealldatafromedatabase();
  // }
}
