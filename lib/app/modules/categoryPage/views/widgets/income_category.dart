// ignore: file_names
// ignore_for_file: non_constant_identifier_names, unnecessary_string_interpolations

import 'dart:developer';

import 'package:flutter/material.dart';
import '../../../../Model/Categroy_Model/catagroy_model.dart';
import 'package:get/get.dart';
import '../../../commonControll/commonController.dart';
import '../../controllers/category_page_controller.dart';

class Incomecategoy extends StatelessWidget {
  Incomecategoy({Key? key}) : super(key: key);
  TextEditingController nameEditingController = TextEditingController();
  final thisincome = categorytype.income;
  final controller = Get.put(CategoryPageController());
  final controllercommen = Get.put(CommonController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          elevation: 0.0,
          backgroundColor: Colors.white10,
          actions: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 0, right: 30),
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                        const Color(0xff0097a7),
                      )),
                      onPressed: () {
                        controllercommen.ShowdCategorupope(
                            context,
                            "Add icome category",
                            thisincome,
                            nameEditingController);
                      },
                      child: const Text("Add some category")),
                ),
              ],
            )
          ],
        ),
        body: GetBuilder<CategoryPageController>(builder: (controller) {
          return controller.incomeCategory.isEmpty
              ? Center(
                  child: ListView(
                    children: [
                      Image.asset(
                        "assets/undraw_Add_notes_re_ln36-removebg-preview.png",
                        height: 280,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 50),
                        child: Text(
                          "No category trying to add new category",
                          style: TextStyle(color: Colors.black45, fontSize: 16),
                        ),
                      )
                    ],
                  ),
                )
              : GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 250,
                      childAspectRatio: 5 / 2,
                      crossAxisSpacing: 0,
                      mainAxisSpacing: 9),
                  itemCount: controller.incomeCategory.length,
                  itemBuilder: (BuildContext ctx, index) {
                    final category = controller.incomeCategory[index];
                    log(category.name);
                    return Padding(
                      padding:
                          const EdgeInsets.only(left: 10, right: 10, top: 10),
                      child: GestureDetector(
                        onLongPress: () async {
                          controllercommen.askingDeleting(context, category);
                          controller.refershUi();
                        },
                        child: Card(
                          elevation: 4,
                          color: Colors.white,
                          child: ListTile(
                            title: Text(category.name),
                          ),
                        ),
                      ),
                    );
                  });
        }));
  }
}
