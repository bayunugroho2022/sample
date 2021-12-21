import 'package:get/get.dart';

import '../controllers/concertric_controller.dart';

class ConcertricBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ConcertricController>(
      () => ConcertricController(),
    );
  }
}
