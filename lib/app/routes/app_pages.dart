import 'package:get/get.dart';

import 'package:bayu_flutter/app/modules/concertric/bindings/concertric_binding.dart';
import 'package:bayu_flutter/app/modules/concertric/views/concertric_view.dart';
import 'package:bayu_flutter/app/modules/detail_shirt/bindings/detail_shirt_binding.dart';
import 'package:bayu_flutter/app/modules/detail_shirt/views/detail_shirt_view.dart';
import 'package:bayu_flutter/app/modules/doctor/bindings/doctor_binding.dart';
import 'package:bayu_flutter/app/modules/doctor/views/doctor_view.dart';
import 'package:bayu_flutter/app/modules/home/bindings/home_binding.dart';
import 'package:bayu_flutter/app/modules/home/views/home_view.dart';
import 'package:bayu_flutter/app/modules/intro/bindings/intro_binding.dart';
import 'package:bayu_flutter/app/modules/intro/views/intro_view.dart';
import 'package:bayu_flutter/app/modules/shirt/bindings/shirt_binding.dart';
import 'package:bayu_flutter/app/modules/shirt/views/shirt_view.dart';
import 'package:bayu_flutter/app/modules/state_custom/bindings/state_custom_binding.dart';
import 'package:bayu_flutter/app/modules/state_custom/views/state_custom_view.dart';

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
    GetPage(
      name: _Paths.DOCTOR,
      page: () => DoctorView(),
      binding: DoctorBinding(),
    ),
    GetPage(
      name: _Paths.SHIRT,
      page: () => ShirtView(),
      binding: ShirtBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_SHIRT,
      page: () => DetailShirtView(),
      binding: DetailShirtBinding(),
    ),
    GetPage(
      name: _Paths.STATE_CUSTOM,
      page: () => StateCustomView(),
      binding: StateCustomBinding(),
    ),
  ];
}
