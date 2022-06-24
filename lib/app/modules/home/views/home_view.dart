import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:levy/app/modules/home/views/widget/recent_translation.dart';
import 'package:levy/app/modules/home/views/widget/totelBalanse.dart';

import '../../../data/db_functions/Translation/translation_db.dart';
import '../../globealVaribles/globle.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          color: Color(0xffe0e0e0),
        ),
        child: ListView(
          children: [
            ValueListenableBuilder(
              builder: (BuildContext context, value, Widget? child) {
                math(value);
                return Total(
                  amount: toteltracstion,
                  heding: "Total balance",
                  monthe: "Budget Limit For $dateTimenow /$dateTimeyear  ",
                );
              },
              valueListenable: Tracnsltion.instense.transltionsnotfier,
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 60, top: 20, bottom: 20),
                  child: const Text(
                    "Transaction history",
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 40),
                  child: TextButton(
                      onPressed: () {
                        // Navigator.push(
                        //     context,
                        //     PageRouteBuilder(
                        //       transitionDuration: const Duration(seconds: 1),
                        //       transitionsBuilder: (context, animation,
                        //           secondaryAnimation, child) {
                        //         animation = CurvedAnimation(
                        //             parent: animation,
                        //             curve: Curves.easeInOutCubicEmphasized);
                        //         return ScaleTransition(
                        //             alignment: Alignment.center,
                        //             child: child,
                        //             scale: animation);
                        //       },
                        //       pageBuilder:
                        //           (context, animation, secondaryAnimation) {
                        //         return const Alltranslation();
                        //       },
                        //     ));
                      },
                      child: const AutoSizeText(
                        "See all",
                        maxLines: 1,
                        style: TextStyle(fontSize: 16),
                      )),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
              child: Container(
                  width: 300,
                  height: 300,
                  decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(color: Colors.grey, blurRadius: 8),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  child: const Tranclations()),
            ),
          ],
        ));
  }
}
