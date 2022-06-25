import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:levy/app/Model/Categroy_Model/catagroy_model.dart';
import 'package:levy/app/modules/addingData/widgets/textFiled_widget.dart';
import 'package:levy/app/modules/buttonnavigation/views/controll_room_view.dart';
import 'package:levy/app/modules/globealVaribles/globle.dart';
import 'package:levy/icons/myicons.dart';
import '../../../Model/Translation_model/translation_model.dart';
import '../../categoryPage/controllers/category_page_controller.dart';
import '../../home/controllers/home_controller.dart';
import '../controllers/upadate_controller.dart';

// ignore: must_be_immutable
class UpadateView extends StatelessWidget {
  // ignore: non_constant_identifier_names
  UpadateView({Key? key, required this.Data}) : super(key: key);

  // ignore: non_constant_identifier_names
  TranclationModel? Data;
  final home = Get.put(HomeController());
  final category = Get.put(CategoryPageController());
  final upadate = Get.put(UpadateController());

  @override
  Widget build(BuildContext context) {
    upadate.oldamount.text = Data!.amount.toString();
    upadate.oldnot.text = Data!.not.toString();
    upadate.oldcategory.text = Data!.catagry.name.toString();
    upadate.dateshowing.text = Data!.datetime.day.toString();
    upadate.monthshwing.text = monthnames[Data!.datetime.month - 1];
    return Scaffold(
      appBar: AppBar(
          actions: const [],
          elevation: 0,
          backgroundColor: const Color.fromARGB(255, 250, 246, 246)),
      body: Container(
          width: 400,
          height: 900,
          decoration:
              const BoxDecoration(color: Color.fromARGB(255, 250, 246, 246)),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          Get.offAll(Controll());
                        },
                        icon: const Icon(
                          MyFlutterApp.cross,
                          size: 30,
                          color: Colors.black54,
                        )),
                    IconButton(
                        onPressed: () async {
                          await upadate.transltionsadding(Data!);
                          Get.off(Controll());
                          home.onInit();
                        },
                        icon: const Icon(
                          MyFlutterApp.checkmark_cicle,
                          size: 30,
                          color: Colors.black54,
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              SizedBox(
                width: 150,
                height: 430,
                child: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Card(
                    elevation: 10,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 25, right: 25, bottom: 20),
                      child: ListView(
                        children: [
                          MycustomTextfild(
                            TextEdigcontroller: upadate.oldamount,
                            hinttexts: 'Amount',
                            icon: Icons.attach_money_sharp,
                            kay: TextInputType.number,
                            keyboddesble: true,
                          ),
                          GestureDetector(
                              onTap: () {
                                bottomsheet(context);
                              },
                              child: MycustomTextfild(
                                TextEdigcontroller: upadate.oldcategory,
                                icon: Icons.category,
                                keyboddesble: false,
                              )),
                          SizedBox(
                            height: 25,
                          ),
                          TextButton.icon(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      side: const BorderSide(
                                        color: Color.fromARGB(255, 93, 93, 93),
                                      ),
                                      borderRadius:
                                          BorderRadius.circular(5.0))),
                            ),
                            onPressed: () async {
                              upadate.monthUpadating(context);
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
                                GetBuilder<UpadateController>(
                                  builder: (GetxController controller) {
                                    return Text(
                                      "${upadate.monthshwing.text} ${upadate.dateshowing.text}",
                                      style: const TextStyle(
                                          color:
                                              Color.fromARGB(255, 84, 83, 83),
                                          fontSize: 14),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                          MycustomTextfild(
                            maxlength: 15,
                            TextEdigcontroller: upadate.oldnot,
                            hinttexts: 'Not',
                            icon: Icons.note_alt,
                            kay: TextInputType.name,
                            keyboddesble: true,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }

  Future bottomsheet(context) async {
    showModalBottomSheet(
        backgroundColor: const Color(0xff0097a7),
        elevation: 0,
        context: context,
        builder: (cotx) {
          return GetBuilder(builder: (ctrol) {
            List<CategoryModel> newData = upadate.buttomsheetworkes(Data!);
            return GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 5 / 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 5),
                itemCount: newData.length,
                itemBuilder: (BuildContext ctx, index) {
                  final category = newData[index];
                  return Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, top: 10),
                    child: GestureDetector(
                      onTap: () {
                        upadate.montheUpadted(category);
                        Navigator.of(cotx).pop();
                      },
                      child: Card(
                        elevation: 10,
                        color: const Color.fromARGB(255, 253, 253, 253),
                        child: ListTile(
                          title: Center(child: Text(category.name)),
                        ),
                      ),
                    ),
                  );
                });
          });
        });
  }
}
