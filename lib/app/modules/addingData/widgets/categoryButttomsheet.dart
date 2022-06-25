import 'package:flutter/material.dart';

import '../../../Model/Categroy_Model/catagroy_model.dart';
import '../../categoryPage/controllers/category_page_controller.dart';
import '../../categoryPage/views/category_page_view.dart';
import 'package:get/get.dart';

import '../../globealVaribles/globle.dart';
import '../controllers/adding_data_controller.dart';

class CategoryButtomController extends GetxController {
  Future bottomsheet(context) async {
    final controller = Get.put(CategoryPageController());
    final controlleradding = Get.put(AddingDataController());

    showModalBottomSheet(
        elevation: 0,
        context: context,
        builder: (cotx) {
          return Container(
            height: 300,
            decoration: const BoxDecoration(
              color: Color(0xff0097a7),
            ),
            child: nowcategory == categorytype.income &&
                    controller.incomeCategory.isEmpty
                ? Column(
                    children: [
                      SizedBox(
                        height: 17,
                      ),
                      SizedBox(
                        width: 200,
                        child: TextButton(
                            onPressed: () {
                              Get.to(CategoryPageView());
                            },
                            child: const Text(
                              "Sorry ! we can found any Category here ,"
                              " Now you can add category ,\nif you want add click here and create category ",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 17),
                            )),
                      ),
                      Center(
                        child: IconButton(
                            onPressed: () {
                              Get.to(CategoryPageView());
                            },
                            icon: const Icon(
                              Icons.add,
                              size: 30,
                              color: Colors.white,
                            )),
                      )
                    ],
                  )
                : nowcategory == categorytype.expanse &&
                        controller.expanseCategory.isEmpty
                    ? Column(
                        children: [
                          SizedBox(
                            height: 17,
                          ),
                          SizedBox(
                            width: 200,
                            child: TextButton(
                                onPressed: () {
                                  Get.to(CategoryPageView());
                                },
                                child: const Text(
                                  "Sorry ! we can found any Category here ,"
                                  " Now you can add category ,\nif you want add click here and create category ",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 17),
                                )),
                          ),
                          Center(
                            child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.add,
                                  size: 30,
                                  color: Colors.white,
                                )),
                          )
                        ],
                      )
                    : GetBuilder<CategoryPageController>(
                        builder: (getxcontroller) {
                        List<CategoryModel> categoryData =
                            controlleradding.checking();
                        return GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: 200,
                                    childAspectRatio: 5 / 2,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 5),
                            itemCount: categoryData.length,
                            itemBuilder: (BuildContext ctx, index) {
                              final category = categoryData[index];

                              return Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, top: 10),
                                child: GestureDetector(
                                  onTap: () {
                                    categoryshow.text =
                                        category.name.toString();
                                    selectedcategory = category;
                                    Navigator.of(cotx).pop();
                                    controller.update();
                                  },
                                  child: Card(
                                    elevation: 10,
                                    color: const Color.fromARGB(
                                        255, 253, 253, 253),
                                    child: ListTile(
                                      title: Text(category.name),
                                    ),
                                  ),
                                ),
                              );
                            });
                      }),
          );
        });
  }
}
