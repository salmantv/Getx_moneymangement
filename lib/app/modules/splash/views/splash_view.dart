// ignore_for_file: use_key_in_widget_constructors

import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';
import 'package:levy/app/modules/categoryPage/controllers/category_page_controller.dart';
import 'package:levy/app/modules/commonControll/commonController.dart';

import '../../buttonnavigation/views/controll_room_view.dart';
import '../../home/controllers/home_controller.dart';

class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  bool _a = false;
  final controller = Get.put(CategoryPageController());
  final homecontroller = Get.put(HomeController());
  final commoncontroller = Get.put(CommonController());

  @override
  void initState() {
    super.initState();
    // alldatalooding();
    Timer(const Duration(milliseconds: 500), () {
      setState(() {
        _a = !_a;
      });
    });
    Timer(const Duration(milliseconds: 3000), () {
      Get.off(Controll());
    });
  }

  @override
  Widget build(BuildContext context) {
    homecontroller.onInit();
    controller.onInit();
    commoncontroller.refresh();

    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 6000),
            curve: Curves.slowMiddle,
            width: _a ? _width : 0,
            height: _height,
            color: const Color(0xff0097a7),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/wallet-front.png",
                  width: 150,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 230),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      FadeAnimatedText("Levy",
                          duration: const Duration(milliseconds: 10000),
                          textStyle: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w300,
                          ))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SlideTransitionAnimation extends PageRouteBuilder {
  final Widget page;

  SlideTransitionAnimation(this.page)
      : super(
            pageBuilder: (context, animation, anotherAnimation) => page,
            transitionDuration: const Duration(milliseconds: 2000),
            transitionsBuilder: (context, animation, anotherAnimation, child) {
              animation = CurvedAnimation(
                curve: Curves.fastLinearToSlowEaseIn,
                parent: animation,
              );
              return SlideTransition(
                position: Tween(
                        begin: const Offset(1.0, 0.0),
                        end: const Offset(0.0, 0.0))
                    .animate(animation),
                textDirection: TextDirection.ltr,
                child: page,
              );
            });
}
