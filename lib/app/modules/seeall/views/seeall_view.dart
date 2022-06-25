// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:levy/app/modules/home/controllers/home_controller.dart';
import 'package:levy/app/modules/seeall/controllers/seeall_controller.dart';
import 'package:levy/app/modules/seeall/views/widgets/fulltransaction.dart';
import 'package:month_year_picker/month_year_picker.dart';
import 'package:get/get.dart';

import '../../../../icons/myicons.dart';
import '../../../Model/Translation_model/translation_model.dart';
import '../../globealVaribles/globle.dart';

class SeeAll extends StatelessWidget {
  SeeAll({Key? key}) : super(key: key);

  final home = Get.put(HomeController());
  final controll = Get.put(SeeallController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffe0e0e0),
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
          elevation: 10,
          backgroundColor: const Color(0xffe0e0e0),
          toolbarHeight: 80,
        ),
        body: SafeArea(
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GetBuilder<SeeallController>(
                      builder: (controller) {
                        return Visibility(
                          visible: dropselectedvalus == '4' ? true : false,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 20,
                            ),
                            child: IconButton(
                                onPressed: () {
                                  onPressed(context: context);
                                },
                                icon: const Icon(MyFlutterApp.calendar)),
                          ),
                        );
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 60),
                      child: GetBuilder<SeeallController>(
                        builder: (controller) {
                          return SizedBox(
                            height: 50,
                            width: 130,
                            child: Card(
                                color: const Color.fromARGB(255, 4, 196, 196),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40.0)),
                                child: DropdownButton(
                                    underline: const Text(""),
                                    value: dropselectedvalus,
                                    focusColor: Colors.black,
                                    items: const [
                                      DropdownMenuItem(
                                        child: Padding(
                                          padding: EdgeInsets.only(left: 20),
                                          child: Text(
                                            "All",
                                            style: TextStyle(fontSize: 15),
                                          ),
                                        ),
                                        value: "1",
                                      ),
                                      DropdownMenuItem(
                                        child: Padding(
                                          padding: EdgeInsets.only(left: 10),
                                          child: Text(
                                            "Today",
                                            style: TextStyle(fontSize: 15),
                                          ),
                                        ),
                                        value: "2",
                                      ),
                                      DropdownMenuItem(
                                        child: Padding(
                                          padding: EdgeInsets.only(left: 10),
                                          child: Text(
                                            "Yesterday",
                                            style: TextStyle(fontSize: 15),
                                          ),
                                        ),
                                        value: "3",
                                      ),
                                      DropdownMenuItem(
                                        child: Padding(
                                          padding: EdgeInsets.only(left: 10),
                                          child: Text(
                                            " Monthly",
                                            style: TextStyle(fontSize: 15),
                                          ),
                                        ),
                                        value: "4",
                                      ),
                                      DropdownMenuItem(
                                        child: Padding(
                                          padding: EdgeInsets.only(left: 10),
                                          child: Text(
                                            " income",
                                            style: TextStyle(fontSize: 15),
                                          ),
                                        ),
                                        value: "5",
                                      ),
                                      DropdownMenuItem(
                                        child: Padding(
                                          padding: EdgeInsets.only(left: 10),
                                          child: Text(
                                            " Expanse",
                                            style: TextStyle(fontSize: 15),
                                          ),
                                        ),
                                        value: "6",
                                      ),
                                    ],
                                    onChanged: (value) {
                                      dropselectedvalus = value.toString();
                                      controll.update();
                                    })),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Datesbuliding(),
            ],
          ),
        ));
  }

  Future<void> onPressed({
    required BuildContext context,
    String? locale,
  }) async {
    final localeObj = locale != null ? Locale(locale) : null;
    final selected = await showMonthYearPicker(
      context: context,
      initialDate: selectedmonth,
      firstDate: DateTime(2017),
      lastDate: DateTime(2023),
      locale: localeObj,
    );

    if (selected != null) {
      // setState(() {
      selectedmonth = selected;
      // });
    }

    home.monthnotfier.clear();
    Future.forEach(home.transltionsnotfier, (TranclationModel element) {
      if (element.datetime.month == selectedmonth.month &&
          element.datetime.year == selectedmonth.year) {
        home.monthnotfier.add(element);
      }
      home.update();
    });
  }
}
