import 'package:get/get.dart';

import 'package:levy/app/modules/addingData/bindings/adding_data_binding.dart';
import 'package:levy/app/modules/buttonnavigation/bindings/buttonnavigation_binding.dart';
import 'package:levy/app/modules/buttonnavigation/views/controll_room_view.dart';
import 'package:levy/app/modules/categoryPage/bindings/category_page_binding.dart';
import 'package:levy/app/modules/categoryPage/views/category_page_view.dart';
import 'package:levy/app/modules/seeall/bindings/seeall_binding.dart';
import 'package:levy/app/modules/seeall/views/seeall_view.dart';
import 'package:levy/app/modules/splash/bindings/splash_binding.dart';
import 'package:levy/app/modules/splash/views/splash_view.dart';
import 'package:levy/app/modules/statistics/bindings/statistics_binding.dart';
import 'package:levy/app/modules/statistics/views/statistics_view.dart';
import 'package:levy/app/modules/upadate/bindings/upadate_binding.dart';
import 'package:levy/app/modules/upadate/views/upadate_view.dart';

import '../modules/addingData/views/adding_data_view.dart';
import '../modules/buttonnavigation/views/buttonnavigation_view.dart';
import '../modules/settings/bindings/settings_binding.dart';
import '../modules/settings/views/settings_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => SecondScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.CONTROLL_ROOM,
      page: () => Controll(),
    ),
    GetPage(
      name: _Paths.BUTTONNAVIGATION,
      page: () => ButtonnavigationView(),
      binding: ButtonnavigationBinding(),
    ),
    GetPage(
      name: _Paths.CATEGORY_PAGE,
      page: () => CategoryPageView(),
      binding: CategoryPageBinding(),
    ),
    GetPage(
      name: _Paths.STATISTICS,
      page: () => StatisticsView(),
      binding: StatisticsBinding(),
    ),
    GetPage(
      name: _Paths.SETTINGS,
      page: () => SettingsView(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: _Paths.ADDING_DATA,
      page: () => AddingDataView(),
      binding: AddingDataBinding(),
    ),
    GetPage(
      name: _Paths.SEEALL,
      page: () => SeeAll(),
      binding: SeeallBinding(),
    ),
    GetPage(
      name: _Paths.UPADATE,
      page: () => UpadateView(
        Data: null,
      ),
      binding: UpadateBinding(),
    ),
  ];
}
