import 'package:bayu_flutter/app/routes/app_pages.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IntroController extends GetxController
    with SingleGetTickerProviderMixin {
  late AnimationController lottieAnimation;
  var expanded = false.obs;
  double bigFontSize = kIsWeb ? 234 : 178;
  final transitionDuration = Duration(seconds: 1);

  final count = 0.obs;

  @override
  void onInit() {
    lottieAnimation = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    Future.delayed(Duration(seconds: 1))
        .then((value) {
          expanded.toggle();
          update();
        })
        .then((value) => Duration(seconds: 1))
        .then(
          (value) => Future.delayed(Duration(seconds: 1)).then(
            (value) => lottieAnimation.forward().then(
                  (value) {
                    Get.offAndToNamed(Routes.HOME);
                  },
                ),
          ),
        );
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void increment() => count.value++;
}
