import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:levy/app/modules/categoryPage/controllers/category_page_controller.dart';
import 'package:levy/app/modules/home/controllers/home_controller.dart';

import '../../../icons/myicons.dart';
import '../../Model/Categroy_Model/catagroy_model.dart';
import '../../Model/Translation_model/translation_model.dart';
import '../addingData/widgets/textFiled_widget.dart';
import '../globealVaribles/globle.dart';

class CommonController extends GetxController {
  final controller = Get.put(CategoryPageController());
  final homecontroll = Get.put(HomeController());

  Future askingDeleting(contescx, category) async {
    showDialog(
        context: contescx,
        builder: (ctx) {
          return AlertDialog(
            title: const Text("Category Deleting"),
            content: SizedBox(
              height: 40,
              child: Column(
                children: const [
                  Text(
                    "Are you sure you want to delete the record ? ",
                    style: TextStyle(fontSize: 15),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(ctx).pop();
                  },
                  child: const Text("Cancel")),
              TextButton(
                  onPressed: () {
                    controller.deletecategory(category.id);
                    controller.update();
                    Navigator.of(ctx).pop();
                  },
                  child: const Text("ok"))
            ],
          );
        });
  }

  Future TransactionDeleting(contescx, TranclationModel value) async {
    showDialog(
        context: contescx,
        builder: (ctx) {
          return AlertDialog(
            title: const Text("Category deleting"),
            content: SizedBox(
              height: 120,
              child: Column(
                children: [
                  const Text(
                    "Are you sure you want to delete the record ?",
                    style: TextStyle(fontSize: 15),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(ctx).pop();
                  },
                  child: const Text("Cancel")),
              TextButton(
                  onPressed: () {
                    homecontroller.deleteingTrastions(value);
                    Navigator.of(contescx).pop();
                    homecontroll.onInit();
                    update();
                    // setState(() {});
                    // addedsnackbar();
                  },
                  child: const Text("ok"))
            ],
          );
        });
  }

  backexitsnackbar(context) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        duration: Duration(seconds: 2),
        backgroundColor: Color.fromARGB(255, 66, 66, 66),
        content: Text(" Press back again to exite ")));
  }

  Future<void> ShowdCategorupope(
    BuildContext context,
    String titel,
    final catrgry,
    final Texteditcondroller,
  ) async {
    showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: Text("$titel"),
            content: SizedBox(
              height: 150,
              child: Column(
                children: [
                  MycustomTextfild(
                    TextEdigcontroller: Texteditcondroller,
                    keyboddesble: true,
                    hinttexts: "Category name",
                    icon: MyFlutterApp.pie_chart,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () async {
                    Navigator.of(context).pop();
                  },
                  child: const Text("Cancel")),
              TextButton(
                  onPressed: () async {
                    final name = Texteditcondroller.text.trim();
                    if (name.isEmpty) {
                      return;
                    }
                    final category = await CategoryModel(
                        DateTime.now().microsecondsSinceEpoch.toString(),
                        name: name,
                        categorytype: catrgry);
                    controller.insertcatgory(category);
                    Navigator.of(context).pop();
                    Texteditcondroller.text = "";
                  },
                  child: const Text("Accept"))
            ],
          );
        });
  }
}
