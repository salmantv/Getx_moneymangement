import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:levy/app/Model/Categroy_Model/catagroy_model.dart';
import 'package:levy/app/modules/addingData/views/adding_data_view.dart';
import 'package:levy/app/modules/commonControll/commonController.dart';
import 'package:levy/app/modules/home/controllers/home_controller.dart';
import 'package:levy/app/modules/upadate/controllers/upadate_controller.dart';
import 'package:levy/app/modules/upadate/views/upadate_view.dart';
import '../../../../../icons/moneyicons.dart';
import '../../../../../icons/myicons.dart';

import '../../../globealVaribles/globle.dart';
import 'package:get/get.dart';

class Tranclations extends StatelessWidget {
  Tranclations({
    Key? key,
  }) : super(key: key);

  final homecontroller = Get.put(HomeController());
  final controllercommen = Get.put(CommonController());
  @override
  Widget build(BuildContext context) {
    homecontroller.onInit();
    return Padding(
        padding: const EdgeInsets.only(top: 15, left: 5, right: 5, bottom: 10),
        child: GetBuilder<HomeController>(
          builder: (controller) {
            return homecontroller.transltionsnotfier.isEmpty
                ? InkWell(
                    onTap: () async {
                      selectedcategory = null;
                      categoryshow.text = '';
                      Get.put(AddingDataView());
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/undraw_Note_list_re_r4u9.png",
                          height: 220,
                        ),
                        const Text(
                          "No transaction now trying to add",
                          style: TextStyle(color: Colors.black45, fontSize: 14),
                        )
                      ],
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                      right: 10,
                      bottom: 20,
                    ),
                    child: ListView.separated(
                      itemBuilder: (BuildContext context, int index) {
                        final newList =
                            homecontroller.transltionsnotfier.reversed;
                        final values = newList.elementAt(index);
                        return Column(children: [
                          GestureDetector(
                            onLongPress: () async {
                              await controlloptions(context, values);
                            },
                            child: ListTile(
                              // onTap: () {},
                              leading: values.categorytyp == categorytype.income
                                  ? const Icon(
                                      Money.finance,
                                      size: 30,
                                      color: Colors.green,
                                    )
                                  : const Icon(
                                      Money.hand_money_rupee_coin,
                                      color: Colors.red,
                                      size: 28,
                                    ),
                              title: AutoSizeText(
                                values.catagry.name.toUpperCase(),
                                maxLines: 1,
                                style: const TextStyle(
                                    fontSize: 14.5,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontWeight: FontWeight.w500),
                              ),
                              subtitle: AutoSizeText(
                                values.not,
                                style: const TextStyle(
                                    fontSize: 12.5,
                                    color: Colors.black54,
                                    fontFamily: "HKGrotesk"),
                              ),
                              trailing: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  AutoSizeText(
                                    values.categorytyp == categorytype.income
                                        ? "   +${values.amount}"
                                        : "   -${values.amount}",
                                    maxLines: 1,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: values.categorytyp ==
                                                categorytype.income
                                            ? const Color.fromARGB(
                                                255, 0, 111, 4)
                                            : Colors.red,
                                        fontFamily: "HKGrotesk-Bold"),
                                  ),
                                  AutoSizeText(
                                    " ${monthnames[values.datetime.month - 1]} ${values.datetime.day} ",
                                    maxLines: 1,
                                    style: const TextStyle(
                                        color: Color.fromARGB(255, 0, 0, 0)),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ]);
                      },
                      itemCount: homecontroller.transltionsnotfier.length < 5
                          ? homecontroller.transltionsnotfier.length
                          : 5,
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          height: 1,
                          width: 0,
                        );
                      },
                    ),
                  );
          },
        ));
  }

  Future controlloptions(contescx, value) async {
    showModalBottomSheet(
        elevation: 0,
        context: contescx,
        builder: (cotx) {
          return SizedBox(
              height: 90,
              width: 100,
              child: ListView(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(contescx).pop();
                        },
                        icon: const Icon(MyFlutterApp.cross),
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.of(contescx).pop();
                            controllercommen.TransactionDeleting(
                                contescx, value);
                          },
                          icon: const Icon(MyFlutterApp.trash_1)),
                      IconButton(
                          onPressed: () {
                            nowcategory = null;
                            Get.to(UpadateView(
                              Data: value,
                            ));
                          },
                          icon: const Icon(MyFlutterApp.pencil_1)),
                    ],
                  )
                ],
              ));
        });
  }
}
