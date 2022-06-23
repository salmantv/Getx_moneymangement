import 'package:flutter/material.dart';
import 'package:levy/app/modules/addingData/widgets/top_Section%20.dart';

class AddingDataView extends StatelessWidget {
  const AddingDataView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      scrollDirection: Axis.vertical,
      child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(color: Color(0xffdddddd)),
          child: const SafeArea(
            child: TopBackgroundcontainer(),
          )),
    ));
  }
}
