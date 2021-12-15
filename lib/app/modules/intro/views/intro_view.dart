import 'package:bayu_flutter/app/utils/color.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../controllers/intro_controller.dart';

class IntroView extends GetView<IntroController> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: primary,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(()=>AnimatedDefaultTextStyle(
              duration: controller.transitionDuration,
              curve: Curves.fastOutSlowIn,
              style: TextStyle(
                color: primary,
                fontSize:
                controller.expanded.isFalse ? controller.bigFontSize : 50,
                fontWeight: FontWeight.w600,
              ),
              child: Text(
                "B",
              ),
            )),
            Obx(() => AnimatedCrossFade(
              firstCurve: Curves.fastOutSlowIn,
              crossFadeState: controller.expanded.isFalse
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              duration: controller.transitionDuration,
              firstChild: Container(),
              secondChild: _logoRemainder(),
              alignment: Alignment.centerLeft,
              sizeCurve: Curves.easeInOut,
            )),
          ],
        ),
      ),
    );
  }

  Widget _logoRemainder() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Bayu Apps",
          style: TextStyle(
            color: white,
            fontSize: 50,
            fontWeight: FontWeight.w600,
          ),
        ),
        LottieBuilder.asset(
          'assets/json/star.json',
          onLoaded: (composition) {
            controller.lottieAnimation..duration = composition.duration;
          },
          frameRate: FrameRate.max,
          repeat: false,
          animate: false,
          height: 100,
          width: 100,
          controller: controller.lottieAnimation,
        )
      ],
    );
  }
}
