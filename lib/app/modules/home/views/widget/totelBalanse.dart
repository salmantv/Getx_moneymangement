// ignore_for_file: file_names

import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';

import '../../controllers/home_controller.dart';
import 'package:get/get.dart';

class Total extends StatelessWidget {
  Total({Key? key, this.heding, this.monthe, this.amount}) : super(key: key);

  String? heding;
  String? monthe;
  double? amount;
  final homecontroller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    homecontroller.onInit();
    return SafeArea(
      child: SizedBox(
        width: 280,
        height: 220,
        child: GetBuilder<HomeController>(
          builder: (controller) {
            return Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40.0)),
              elevation: 20,
              color: const Color(0xff0097a7),
              margin: const EdgeInsets.only(top: 45, left: 30, right: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "$heding",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 33,
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  AutoSizeText(
                    amount! > 0 ? "₹ ${amount}" : "0.00",
                    maxLines: 1,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    " ${monthe}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 13.0,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
