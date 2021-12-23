import 'package:get/get.dart';

import '../controllers/shirt_controller.dart';

class ShirtBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShirtController>(
      () => ShirtController(),
    );
  }
}
