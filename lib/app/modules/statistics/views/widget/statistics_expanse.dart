import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:levy/app/modules/home/controllers/home_controller.dart';
import '../../../globealVaribles/globle.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../home/views/widget/totelBalanse.dart';

class Expansewidget extends StatelessWidget {
  Expansewidget({Key? key}) : super(key: key);

  final home = Get.put(HomeController());
  late TooltipBehavior _tooltipBehavior;

  @override
  Widget build(BuildContext context) {
    _tooltipBehavior = TooltipBehavior(
      enable: true,
      canShowMarker: false,
    );

    List<Chartdata> connectedList = chartlogic(home.expansenotfiere);

    return Scaffold(
        body: Container(
      color: const Color(0xffe0e0e0),
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
              height: 20,
            ),
            SizedBox(
                height: 350,
                child: connectedList.isEmpty
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text(
                            "No transaction now trying to add",
                            style:
                                TextStyle(color: Colors.black45, fontSize: 16),
                          ),
                          Image.asset(
                            'assets/chart_data_.png',
                            height: 250,
                          ),
                        ],
                      )
                    : connectedList.length < 2
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Text(
                                "Minimum two expanse transaction",
                                style: TextStyle(
                                    color: Colors.black87, fontSize: 16),
                              ),
                              Image.asset(
                                'assets/chart_data_.png',
                                height: 250,
                              ),
                            ],
                          )
                        : SfCartesianChart(
                            title: ChartTitle(
                              text: 'Expanse Category analysis',
                              textStyle: const TextStyle(
                                  color: Colors.black54,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                            ),
                            primaryXAxis: CategoryAxis(),
                            primaryYAxis: NumericAxis(isVisible: false),
                            series: <ChartSeries<Chartdata, String>>[
                                // Renders column chart
                                ColumnSeries<Chartdata, String>(
                                    dataSource: connectedList,
                                    xValueMapper: (Chartdata data, _) =>
                                        data.categories,
                                    yValueMapper: (Chartdata data, _) =>
                                        data.amount,
                                    pointColorMapper: (Chartdata data, _) =>
                                        const Color.fromARGB(255, 161, 45, 12),
                                    dataLabelSettings: const DataLabelSettings(
                                        isVisible: true))
                              ])),
            Total(
              amount: totelexpanse,
              heding: 'Totel Expanse',
              monthe: 'Stop solving problems with new products.',
            ),
          ],
        ),
      )),
    ));
  }
}
