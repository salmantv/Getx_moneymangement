// ignore_for_file: file_names

import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/material.dart';
import 'package:levy/app/modules/addingData/controllers/adding_data_controller.dart';
import 'package:get/get.dart';

class Topsection extends StatelessWidget {
  const Topsection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddingDataController());
    controller.onInit();
    return Column(
      children: [
        IconButton(
            padding: const EdgeInsets.only(right: 300, top: 30),
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              size: 30,
              color: Colors.white,
            )),
        // Padding(
        //   padding: const EdgeInsets.only(top: 5),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //   ),
        // ),
        Padding(
          padding: const EdgeInsets.only(
            top: 20,
          ),
          child: CustomRadioButton(
              defaultSelected: "Income",
              selectedBorderColor: const Color(0xff0097a7),
              unSelectedBorderColor: const Color.fromARGB(255, 255, 255, 255),
              enableShape: true,
              height: 50,
              width: 140.0,
              margin: const EdgeInsets.only(left: 20, right: 20),
              shapeRadius: 20,
              unSelectedColor: const Color.fromARGB(255, 255, 255, 255),
              buttonLables: const [
                'Income',
                'Expanse',
              ],
              buttonValues: const [
                "Income",
                "Expanse",
              ],
              buttonTextStyle: const ButtonTextStyle(
                  selectedColor: Colors.white,
                  unSelectedColor: Colors.black38,
                  textStyle: TextStyle(fontSize: 16)),
              radioButtonValue: controller.radioButtonWorking,
              selectedColor: const Color(0xff0097a7)),
        )
      ],
    );
  }
}
