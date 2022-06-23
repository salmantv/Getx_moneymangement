// ignore: file_names

import 'package:flutter/material.dart';
import 'package:levy/app/modules/categoryPage/views/widgets/expanse_category.dart';
import 'package:levy/app/modules/categoryPage/views/widgets/income_category.dart';

import 'package:sizer/sizer.dart';

import '../../../../icons/moneyicons.dart';
import '../../globealVaribles/globle.dart';

// ignore: camel_case_types
class CategoryPageView extends StatelessWidget {
  const CategoryPageView({Key? key}) : super(key: key);

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
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.white10,
              elevation: 00,
              toolbarHeight: 80,
              bottom: TabBar(
                  labelColor: const Color(0xff0097a7),
                  unselectedLabelColor: Colors.black45,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    color: Color(0x14000000),
                  ),
                  tabs: [
                    Tab(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Icon(Money.finance),
                        Text("Income"),
                      ],
                    )),
                    Tab(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Icon(
                          Money.business_loss_downfall,
                        ),
                        Text("Expanse"),
                      ],
                    )),
                  ])),
          body: TabBarView(children: [
            Center(
              child: Incomecategoy(),
            ),
            Center(
              child: ExpanseCategory(),
            ),
          ]),
        ),
      ),
    );
  }

  // backexitsnackbar() {
  //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
  //       duration: Duration(seconds: 2),
  //       backgroundColor: Color.fromARGB(255, 66, 66, 66),
  //       content: Text(" Press back again to exite ")));
  // }
}
