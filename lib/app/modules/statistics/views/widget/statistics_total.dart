// ignore_for_file: unused_field, invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:levy/app/modules/home/controllers/home_controller.dart';
import 'package:month_year_picker/month_year_picker.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../../icons/myicons.dart';
import '../../../../Model/Translation_model/translation_model.dart';
import '../../../globealVaribles/globle.dart';

class Overreview extends StatelessWidget {
  Overreview({Key? key}) : super(key: key);

  final home = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    late TooltipBehavior _tooltipBehavior;
    _tooltipBehavior = TooltipBehavior(enable: true);

    List<Chartdata> all = chartlogic(home.transltionsnotfier);
    List<Chartdata> today = chartlogic(home.todaynotfier);
    List<Chartdata> yesterday = chartlogic(home.yesterdaynotfier);
    List<Chartdata> monthly = chartlogic(home.monthnotfier);

    return Scaffold(
      backgroundColor: const Color(0xffe0e0e0),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView(
          children: [
            Row(
              children: [
                Visibility(
                  visible: chartdrop == 'monthnotfier' ? true : false,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20, left: 60),
                    child: IconButton(
                        onPressed: () {
                          onPressed(context: context);
                        },
                        icon: const Icon(MyFlutterApp.calendar)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 10,
                    left: 60,
                  ),
                  child: Container(
                    margin: const EdgeInsets.only(right: 70, top: 20),
                    width: 130,
                    height: 50, //It will take a 20% of screen width
                    child: Card(
                      color: const Color.fromARGB(255, 4, 196, 196),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0)),
                      child: DropdownButton(
                        underline: const Text(""),
                        value: chartdrop,
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
                            value: "transltionsnotfier",
                          ),
                          DropdownMenuItem(
                            child: Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                "Today",
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                            value: "todaynotfier",
                          ),
                          DropdownMenuItem(
                            child: Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                "Yesterday",
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                            value: "yesterdaynotfier",
                          ),
                          DropdownMenuItem(
                            child: Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                " Monthly",
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                            value: "monthnotfier",
                          ),
                        ],
                        onChanged: (newvalue) {
                          // setState(() {
                          chartdrop = newvalue.toString();
                          // });
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 0,
                  right: 0,
                  bottom: 0,
                ),
                child: Column(children: [
                  SizedBox(
                    height: 450,
                    child: all.isEmpty
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Text(
                                "No transaction now trying to add",
                                style: TextStyle(
                                    color: Colors.black45, fontSize: 16),
                              ),
                              Image.asset(
                                'assets/chart_data_.png',
                                height: 200,
                              ),
                            ],
                          )
                        : SfCircularChart(
                            legend: Legend(
                              isVisible: true,
                            ),
                            title: ChartTitle(text: 'Totel transactions'),
                            series: <DoughnutSeries>[
                                // Render pie chart
                                DoughnutSeries<Chartdata, String>(
                                    dataLabelSettings: const DataLabelSettings(
                                      isVisible: true,
                                      labelIntersectAction:
                                          LabelIntersectAction.shift,
                                    ),
                                    dataSource: chartdrop ==
                                            'transltionsnotfier'
                                        ? all
                                        : chartdrop == 'todaynotfier'
                                            ? today
                                            : chartdrop == 'yesterdaynotfier'
                                                ? yesterday
                                                : chartdrop == 'monthnotfier'
                                                    ? monthly
                                                    : all,
                                    xValueMapper: (Chartdata data, _) =>
                                        data.categories,
                                    yValueMapper: (Chartdata data, _) =>
                                        data.amount,
                                    explode: true,
                                    explodeIndex: 1),
                              ]),
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
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
      //upadate
    });
  }
}
