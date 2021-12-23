import 'package:get/get.dart';

import '../controllers/detail_shirt_controller.dart';

class DetailShirtBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailShirtController>(
      () => DetailShirtController(),
    );
  }
}
