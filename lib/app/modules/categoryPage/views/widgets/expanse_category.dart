// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:levy/app/Model/Categroy_Model/catagroy_model.dart';

import 'package:get/get.dart';
import 'package:levy/app/modules/commonControll/commonController.dart';

import '../../controllers/category_page_controller.dart';

class ExpanseCategory extends StatelessWidget {
  ExpanseCategory({Key? key}) : super(key: key);

  TextEditingController expanseController = TextEditingController();
  final thisincome = categorytype.expanse;
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
                  padding: const EdgeInsets.only(top: 0, right: 20),
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
                            expanseController);
                      },
                      child: const Text("Add some category")),
                ),
              ],
            )
          ],
        ),
        body: GetBuilder<CategoryPageController>(
          builder: (controller1) {
            return controller.expanseCategory.isEmpty
                ? Center(
                    child: ListView(
                      children: [
                        Image.asset(
                          "assets/undraw_Add_notes_re_ln36-removebg-preview.png",
                          height: 300,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 50),
                          child: Text(
                            "No category trying to add new category",
                            style:
                                TextStyle(color: Colors.black45, fontSize: 16),
                          ),
                        )
                      ],
                    ),
                  )
                : GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            childAspectRatio: 5 / 2,
                            crossAxisSpacing: 4,
                            mainAxisSpacing: 5),
                    itemCount: controller.expanseCategory.length,
                    itemBuilder: (BuildContext ctx, index) {
                      final category = controller.expanseCategory[index];
                      return Padding(
                        padding:
                            const EdgeInsets.only(left: 10, right: 10, top: 10),
                        child: GestureDetector(
                          onLongPress: () async {
                            final controllercommen =
                                Get.put(CommonController());
                            controllercommen.askingDeleting(context, category);
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
          },
        ));
  }

  // Future<void> showdCategorupope(BuildContext context, String titel,
  //     final catrgry, final Texteditcondroller) async {
  //   showDialog(
  //       context: context,
  //       builder: (ctx) {
  //         return AlertDialog(
  //           title: Text(titel),
  //           content: SizedBox(
  //             height: 150,
  //             child: Column(
  //               children: [
  //                 MycustomTextfild(
  //                   TextEdigcontroller: Texteditcondroller,
  //                   keyboddesble: true,
  //                   hinttexts: "Category name",
  //                   icon: MyFlutterApp.pie_chart,
  //                 ),
  //                 const SizedBox(
  //                   height: 20,
  //                 ),
  //               ],
  //             ),
  //           ),
  //           actions: [
  //             TextButton(
  //                 onPressed: () {
  //                   Navigator.of(context).pop();
  //                 },
  //                 child: const Text("Cancel")),
  //             TextButton(
  //                 onPressed: () async {
  //                   final name = Texteditcondroller.text.trim();
  //                   if (name.isEmpty) {
  //                     return;
  //                   }
  //                   final _category = CategoryModel(
  //                       DateTime.now().microsecondsSinceEpoch.toString(),
  //                       name: name,
  //                       categorytype: catrgry);
  //                   controller.insertcatgory(_category);
  //                   Navigator.of(context).pop();
  //                   emexpanseController.text = "";
  //                 },
  //                 child: const Text("Accept"))
  //           ],
  //         );
  //       });
  // }
}
