import 'package:bayu_flutter/app/modules/shirt/controllers/shirt_controller.dart';
import 'package:get/get.dart';

import '../controllers/state_custom_controller.dart';

class StateCustomBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StateCustomController>(
      () => StateCustomController(),
    );
    Get.lazyPut<ShirtController>(
          () => ShirtController(),);
  }
}
