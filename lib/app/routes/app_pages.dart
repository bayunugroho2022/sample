import 'package:get/get.dart';

import 'package:bayu_flutter/app/modules/concertric/bindings/concertric_binding.dart';
import 'package:bayu_flutter/app/modules/concertric/views/concertric_view.dart';
import 'package:bayu_flutter/app/modules/home/bindings/home_binding.dart';
import 'package:bayu_flutter/app/modules/home/views/home_view.dart';
import 'package:bayu_flutter/app/modules/intro/bindings/intro_binding.dart';
import 'package:bayu_flutter/app/modules/intro/views/intro_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.INTRO;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.INTRO,
      page: () => IntroView(),
      binding: IntroBinding(),
    ),
    GetPage(
      name: _Paths.CONCERTRIC,
      page: () => ConcertricView(),
      binding: ConcertricBinding(),
    ),
  ];
}
