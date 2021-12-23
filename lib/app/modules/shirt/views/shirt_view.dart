import 'package:bayu_flutter/app/modules/detail_shirt/views/detail_shirt_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/shirt_controller.dart';

const duration = Duration(milliseconds: 500);
class ShirtView extends GetView<ShirtController> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Positioned(
              bottom: size.width * 0.10,
              height: size.height / 10,
              left: 20,
              right: 20,
              child: DecoratedBox(
                decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
                  BoxShadow(
                      color: Colors.black,
                      blurRadius: 90,
                      offset: Offset.zero,
                      spreadRadius: 45)
                ]),
              )),
          Obx(() =>Transform.scale(
            scale: 1.6,
            alignment: Alignment.bottomCenter,
            child: PageView.builder(
                controller: controller.pageShirtController,
                itemCount: controller.listShirt.length + 1,
                scrollDirection: Axis.vertical,
                onPageChanged: (val) {
                  if (val < controller.listShirt.length) {
                    controller.pageTextController.animateToPage(val,
                        duration: duration, curve: Curves.decelerate);
                  }
                },
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return SizedBox.shrink();
                  }
                  return Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: Obx(() =>Transform(
                      transform: Matrix4.identity()
                        ..translate(0.0, size.height / 2.6 * (1 - (-0.4 * (controller.currentPage.value - index + 1) + 1)).abs())
                        ..scale(-0.4 * (controller.currentPage.value - index + 1) + 1),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                              PageRouteBuilder(
                                  transitionDuration: Duration(seconds: 1),
                                  reverseTransitionDuration: Duration(seconds: 1),
                                  pageBuilder: (context,animation,secondaryAnimation){
                                    final curvedAnimation =CurvedAnimation(
                                        parent: animation,
                                        curve: Interval(0,0.5)
                                    );
                                    return FadeTransition(
                                        opacity: curvedAnimation,
                                        child: DetailShirtView(
                                            shirt : controller.listShirt[index - 1],
                                            tagImage:controller.listShirt[index - 1].image! + index.toString()));
                                  })
                          );
                        },
                        child: Hero(
                          tag: controller.listShirt[index - 1].image! + index.toString(),
                          child: Obx(() =>Opacity(
                              opacity: (-0.4 * (controller.currentPage.value - index + 1) + 1).clamp(0.0, 1.0),
                              child: Image.asset(
                                controller.listShirt[index - 1].image!,
                                width: 50,
                                height: 40,
                                fit: BoxFit.fitHeight,
                              ))),
                        ),
                      ),
                    )),
                  );
                }),
          )),
          Positioned(
              height: 100,
              top: size.height * 0.1,
              left: size.width * 0.3,
              right: 0,
              child: Column(
                children: [
                  Expanded(
                    child: PageView.builder(
                        itemCount: controller.listShirt.length,
                        physics: NeverScrollableScrollPhysics(),
                        controller: controller.pageTextController,
                        itemBuilder: (context, index) {
                          return Obx(() =>Opacity(
                              opacity: (1 - (index - controller.textPage.value).abs()).clamp(0.0, 1.0),
                              child: Center(
                                  child: Text(
                                    controller.listShirt[index].name!,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 30, fontWeight: FontWeight.bold),
                                  ))));
                        }),
                  ),
                  AnimatedSwitcher(
                    duration: duration,
                    child: Obx(() =>Text(controller.listShirt[controller.currentPage.toInt()].price!,
                      style: TextStyle(
                          fontSize: 30),
                    )),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
