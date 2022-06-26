// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:levy/app/modules/home/controllers/home_controller.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../globealVaribles/globle.dart';
import '../../../home/views/widget/totelBalanse.dart';

class Chartincome extends StatelessWidget {
  Chartincome({Key? key}) : super(key: key);
  final home = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    List<Chartdata> connectedList = chartlogic(home.incomenotfiere);
    // chartdb().refrsh();
    return Scaffold(
        backgroundColor: const Color(0xffe0e0e0),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Center(
              child: Padding(
            padding: const EdgeInsets.only(
              left: 10,
              right: 10,
              bottom: 0,
            ),
            child: ListView(
              children: [
                SizedBox(
                    width: 450, //It will take a 20% of screen width
                    height: 330,
                    child: FutureBuilder(
                      builder: (BuildContext context,
                          AsyncSnapshot<dynamic> snapshot) {
                        return connectedList.isEmpty
                            ? Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  const Text(
                                    "No transaction now trying to add",
                                    style: TextStyle(
                                        color: Colors.black45, fontSize: 16),
                                  ),
                                  Image.asset(
                                    'assets/chart_data_.png',
                                    height: 250,
                                  ),
                                ],
                              )
                            : SfCircularChart(
                                legend: Legend(
                                    isVisible: true,
                                    borderColor: Colors.black54,
                                    borderWidth: 1),
                                title: ChartTitle(
                                  text: 'Income category analysis',
                                  textStyle: const TextStyle(
                                      color: Colors.black54,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
                                series: <CircularSeries>[
                                    // Render pie chart
                                    PieSeries<Chartdata, String>(
                                      dataLabelSettings:
                                          const DataLabelSettings(
                                        isVisible: true,
                                      ),
                                      dataSource: connectedList,
                                      xValueMapper: (Chartdata data, _) =>
                                          data.categories,
                                      yValueMapper: (Chartdata data, _) =>
                                          data.amount,
                                    )
                                  ]);
                      },
                    )),
                Total(
                  amount: totelincome,
                  heding: 'Total income',
                  monthe: 'Make money and live life good',
                ),
              ],
            ),
          )),
        ));
  }
}
