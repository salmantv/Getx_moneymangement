import 'package:flutter/material.dart';
import 'package:levy/app/Model/Categroy_Model/catagroy_model.dart';
import 'package:levy/app/modules/addingData/views/adding_data_view.dart';
import 'package:levy/app/modules/commonControll/commonController.dart';
import 'package:levy/app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';
import 'package:levy/app/modules/seeall/controllers/seeall_controller.dart';
import 'package:levy/app/modules/upadate/views/upadate_view.dart';

import '../../../../../icons/moneyicons.dart';
import '../../../../../icons/myicons.dart';
import '../../../../Model/Translation_model/translation_model.dart';
import '../../../globealVaribles/globle.dart';

class Datesbuliding extends StatelessWidget {
  Datesbuliding({Key? key, this.name, this.value}) : super(key: key);

  late final name;
  late final value;
  final home = Get.put(HomeController());
  final commencontroll = Get.put(CommonController());
  final seeall = Get.put(SeeallController());

  @override
  Widget build(BuildContext context) {
    home.onInit();
    return home.transltionsnotfier.isEmpty
        ? InkWell(
            onTap: () async {
              selectedcategory = null;
              categoryshow;
              categoryshow.text = '';
              Navigator.of(context).push(MaterialPageRoute(builder: (contex) {
                return const AddingDataView();
              }));
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/emptydata.png",
                  height: 220,
                ),
                const Text(
                  "No transaction now trying to add",
                  style: TextStyle(color: Colors.black45, fontSize: 16),
                )
              ],
            ),
          )
        : SizedBox(
            child: GetBuilder<HomeController>(builder: (buildcontroll) {
              List<TranclationModel> Data = chackingdropdown();
              return ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: Data.length,
                itemBuilder: (BuildContext context, int index) {
                  final valur = Data[index];
                  return Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 8),
                    child: GestureDetector(
                      onLongPress: () async {
                        dropselectedvalus == '4'
                            ? const SizedBox()
                            : await controlloptions(context, valur);
                      },
                      child: Card(
                          elevation: 5,
                          color: Colors.white,
                          child: ListTile(
                            leading: valur.categorytyp == categorytype.expanse
                                ? const Icon(
                                    Money.hand_money_rupee_coin,
                                    color: Color.fromARGB(255, 181, 6, 6),
                                    size: 30,
                                  )
                                : const Icon(
                                    Money.finance,
                                    color: Colors.green,
                                    size: 30,
                                  ),
                            title: Text(
                              valur.catagry.name,
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 30, 29, 29),
                                  fontFamily: "HKGrotesk-Bold"),
                            ),
                            subtitle: Text(
                              valur.not,
                              style: const TextStyle(
                                  color: Colors.black54,
                                  fontFamily: "HKGrotesk"),
                            ),
                            trailing: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  valur.categorytyp == categorytype.income
                                      ? '+' " ${valur.amount}"
                                      : '-'
                                          " ${valur.amount}",
                                  style: TextStyle(
                                      color: valur.categorytyp ==
                                              categorytype.income
                                          ? const Color.fromARGB(255, 1, 255, 9)
                                          : Colors.red,
                                      fontFamily: "HKGrotesk-Bold"),
                                ),
                                Text(
                                  " ${monthnames[valur.datetime.month - 1]} ${valur.datetime.day} ",
                                  style: const TextStyle(
                                      color: Color.fromARGB(255, 23, 23, 23)),
                                ),
                              ],
                            ),
                          )),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    height: 5,
                  );
                },
              );
            }),
          );
  }

  chackingdropdown() {
    if (dropselectedvalus == "1") {
      return home.transltionsnotfier;
    } else if (dropselectedvalus == '2') {
      // home.refrsh();
      return home.todaynotfier;
    } else if (dropselectedvalus == '3') {
      return home.yesterdaynotfier;
    } else if (dropselectedvalus == '4') {
      return home.monthnotfier;
    } else if (dropselectedvalus == '5') {
      return home.incomenotfiere;
    } else if (dropselectedvalus == "6") {
      return home.expansenotfiere;
    } else {
      return home.transltionsnotfier;
    }
  }

  Future controlloptions(context, value) async {
    showModalBottomSheet(
        elevation: 0,
        context: context,
        builder: (cotx) {
          return SizedBox(
              height: 90,
              width: 120,
              child: ListView(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(MyFlutterApp.cross),
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.of(cotx).pop();
                            commencontroll.TransactionDeleting(context, value);
                          },
                          icon: const Icon(MyFlutterApp.trash_1)),
                      IconButton(
                          onPressed: () {
                            nowcategory = null;
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (contex) {
                              return UpadateView(Data: value);
                            }));
                          },
                          icon: const Icon(MyFlutterApp.pencil_1)),
                    ],
                  )
                ],
              ));
        });
  }
}
