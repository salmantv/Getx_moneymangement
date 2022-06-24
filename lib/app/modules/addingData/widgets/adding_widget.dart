// ignore_for_file: prefer_typing_uninitialized_variables, unused_local_variable, file_names, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../icons/myicons.dart';
import '../../../Model/Categroy_Model/catagroy_model.dart';
import '../../../Model/Translation_model/translation_model.dart';
import '../../../data/db_functions/Category_db/category_db.dart';
import '../../../data/db_functions/Translation/translation_db.dart';
import '../../../data/db_functions/category_db/category_db.dart';
import '../../buttonnavigation/views/controll_room_view.dart';
import '../../categoryPage/controllers/category_page_controller.dart';
import '../../globealVaribles/globle.dart';
import 'textFiled_widget.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class Detailsadding extends StatefulWidget {
  const Detailsadding({Key? key}) : super(key: key);

  @override
  State<Detailsadding> createState() => _DetailsaddingState();
}

class _DetailsaddingState extends State<Detailsadding> {
  final controller = Get.put(CategoryPageController());

  final amountcondroller = TextEditingController();
  final notescondroller = TextEditingController();
  final categorycondroller = TextEditingController();
  DateTime? selecteddate;
  final dateshowing = TextEditingController();
  final monthshwing = TextEditingController();
  final formKey = GlobalKey<FormState>();
  double amoutparsed = 0;

  @override
  void initState() {
    super.initState();
    dateshowing.text = DateTime.now().day.toString();
    monthshwing.text = monthnames[DateTime.now().month - 1];
    selecteddate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
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
                    controller: amountcondroller,
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
                      bottomsheet(context);
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
                    await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now()
                                .subtract(const Duration(days: 365)),
                            lastDate: DateTime.now())
                        .then((value) {
                      setState(() {
                        dateshowing.text = value!.day.toString();
                        monthshwing.text = monthnames[value.month - 1];
                        selecteddate = value;
                      });
                    });
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
                      Text(
                        "${monthshwing.text} ${dateshowing.text}",
                        style: const TextStyle(
                            color: Color.fromARGB(255, 84, 83, 83),
                            fontSize: 14),
                      ),
                    ],
                  ),
                ),
                MycustomTextfild(
                  maxlength: 16,
                  TextEdigcontroller: notescondroller,
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
                      await transltionsadding();
                      selecteddate == null ||
                              selectedcategory == null ||
                              amountcondroller.text == '' ||
                              amountcondroller.text == '0'
                          ? ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  duration: Duration(seconds: 2),
                                  behavior: SnackBarBehavior.floating,
                                  backgroundColor: Colors.red,
                                  content: Text(" Please fill the text box")))
                          : Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(builder: (context) {
                              return Controll();
                            }), (route) => false);
                      chartdrop = 'transltionsnotfier';
                      setState(() {});
                    },
                    child: const Text("Add")),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> transltionsadding() async {
    double amoutparsed = double.tryParse(amountcondroller.text) ?? 0;

    if (selectedcategory == null) {
      return;
    }

    if (selecteddate == null) {
      return;
    }

    final value = TranclationModel(
        catagry: selectedcategory!,
        amount: amoutparsed,
        categorytyp: nowcategory!,
        datetime: selecteddate!,
        not: notescondroller.text == "" ? 'Note : empty' : notescondroller.text,
        id: DateTime.now().microsecondsSinceEpoch.toString());
    Tracnsltion.instense.addtransltion(value);
  }

  Future bottomsheet(context) async {
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
                              // Navigator.of(context)
                              //     .push(MaterialPageRoute(builder: (ctx) {
                              //   return const Category_Page();
                              // }));
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
                            onPressed: () {},
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
                                  // Navigator.of(context)
                                  //     .push(MaterialPageRoute(builder: (ctx) {
                                  //   return const Category_Page();
                                  // }));
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
                        builder: (Getxcontroller) {
                        List<CategoryModel> categoryData = checking();
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
                                    // categoryshow.text =
                                    //     category.name.toString();
                                    // selectedcategory = category;
                                    // Navigator.of(cotx).pop();
                                    // setState(() {});
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

  checking() {
    if (nowcategory == categorytype.income) {
      controller.incomeCategory;
      selectedcategory = null;
      return controller.incomeCategory;
    } else {
      controller.expanseCategory;
      return controller.expanseCategory;
    }
  }
}
