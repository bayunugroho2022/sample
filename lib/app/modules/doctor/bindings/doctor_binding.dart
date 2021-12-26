import 'package:bayu_flutter/app/modules/concertric/controllers/concertric_controller.dart';
import 'package:bayu_flutter/app/modules/shirt/controllers/shirt_controller.dart';
import 'package:get/get.dart';

import '../controllers/doctor_controller.dart';

class DoctorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DoctorController>(
      () => DoctorController(),
    );
    Get.lazyPut<ShirtController>(
            () => ShirtController(),);

    Get.lazyPut<ConcertricController>(
            () => ConcertricController(),);
    }
}
