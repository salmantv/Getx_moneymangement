// ignore_for_file: prefer_typing_uninitialized_variables, unused_local_variable, file_names, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:levy/app/modules/addingData/controllers/adding_data_controller.dart';
import 'package:levy/app/modules/addingData/widgets/categoryButttomsheet.dart';
import '../../../../icons/myicons.dart';
import '../../buttonnavigation/views/controll_room_view.dart';
import '../../categoryPage/controllers/category_page_controller.dart';
import '../../globealVaribles/globle.dart';
import 'textFiled_widget.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class Detailsadding extends StatelessWidget {
  Detailsadding({Key? key}) : super(key: key);

  final controller = Get.put(CategoryPageController());
  final controlleradding = Get.put(AddingDataController());
  final buttomSheet = Get.put(CategoryButtomController());
  final categorycondroller = TextEditingController();
  final formKey = GlobalKey<FormState>();
  double amoutparsed = 0;

  @override
  Widget build(BuildContext context) {
    controlleradding.onInit();
    return Positioned(
      top: 200,
      left: 20,
      child: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Container(
          width: 350,
          height: 500,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 1.0),
                    blurRadius: 40.0)
              ]),
          child: Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, bottom: 20),
            child: ListView(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: [
                SizedBox(
                  height: 40,
                ),
                Form(
                  key: formKey,
                  child: TextFormField(
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(15),
                    ],
                    controller: controlleradding.amountcondroller,
                    enabled: true,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        disabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black54, width: 1)),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black87,
                            style: BorderStyle.solid,
                            width: 1,
                          ),
                        ),
                        contentPadding: EdgeInsets.only(),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black54, width: 1)),
                        prefixIcon: Icon(
                          MyFlutterApp.money,
                          color: Color.fromARGB(255, 43, 164, 47),
                        ),
                        hintText: 'Amount'),
                  ),
                ),
                GestureDetector(
                    onTap: () {
                      buttomSheet.bottomsheet(context);
                    },
                    child: MycustomTextfild(
                      TextEdigcontroller: categoryshow,
                      hinttexts: "Category",
                      icon: MyFlutterApp.pie_chart,
                      keyboddesble: false,
                    )),
                SizedBox(
                  height: 40,
                ),
                TextButton.icon(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        side: const BorderSide(
                          color: Color.fromARGB(255, 93, 93, 93),
                        ),
                        borderRadius: BorderRadius.circular(5.0))),
                  ),
                  onPressed: () async {
                    await controlleradding.monthepicker(context);
                  },
                  icon: const Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Icon(
                      MyFlutterApp.calendar,
                      color: Color.fromARGB(255, 43, 164, 47),
                    ),
                  ),
                  label: Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      GetBuilder<AddingDataController>(
                        builder: (GetxController controller) {
                          return Text(
                            "${controlleradding.monthshwing.text} ${controlleradding.dateshowing.text}",
                            style: const TextStyle(
                                color: Color.fromARGB(255, 84, 83, 83),
                                fontSize: 14),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                MycustomTextfild(
                  maxlength: 16,
                  TextEdigcontroller: controlleradding.notescondroller,
                  hinttexts: "Add some notes",
                  icon: MyFlutterApp.note,
                  kay: TextInputType.name,
                  keyboddesble: true,
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          const Color(0xff0097a7),
                        ),
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.only(
                                left: 60, right: 60, top: 15, bottom: 15))),
                    onPressed: () async {
                      formKey.currentState!.validate();
                      await controlleradding.transltionsadding();
                      controlleradding.selecteddate == null ||
                              controlleradding.amountcondroller.text == '' ||
                              controlleradding.amountcondroller.text == '0'
                          ? ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  duration: Duration(seconds: 2),
                                  behavior: SnackBarBehavior.floating,
                                  backgroundColor: Colors.red,
                                  content: Text(" Please fill the text box")))
                          : Get.off(Controll());
                      homecontroller.onInit();
                      chartdrop = 'transltionsnotfier';
                    },
                    child: const Text("Add")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
