import 'package:bayu_flutter/app/modules/widgets/bounce_widget.dart';
import 'package:bayu_flutter/app/utils/color.dart';
import 'package:bayu_flutter/app/utils/fade_animation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary,
        leading: BouncingWidget(
          duration: Duration(milliseconds: 100),
          scaleFactor: 1.5,
          onPressed: () {

          },
          child: Icon(
            Icons.menu,
            color: white,
          ),
        ),
        title: Text(
          'Bayu App',
          style: TextStyle(color: white),
        ),
        centerTitle: true,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: BouncingWidget(
              duration: Duration(milliseconds: 100),
              scaleFactor: 1.5,
              onPressed: () {

              },
              child: Icon(
                Icons.search,
                color: white,
              ),
            ),
          )
        ],
      ),
      body: Container(
        width: Get.width,
        margin: EdgeInsets.all(8.0),
        height: Get.height,
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Container(
              width: Get.width,
              margin: EdgeInsets.all(8.0),
              height: Get.height / 3.2,
              child: Stack(
                children: [
                  Positioned(
                    top: Get.height / 10 + 10,
                    left: 10,
                    right: 10,
                    child: FadeInUp(
                      delay: Duration(milliseconds: 500),
                      child: BouncingWidget(
                        duration: Duration(milliseconds: 100),
                        scaleFactor: 1.5,
                        onPressed: () {

                        },
                        child: Card(
                          color: primary,
                          elevation: 8,
                          child: Container(
                            width: Get.width,
                            margin: EdgeInsets.all(8.0),
                            height: Get.height / 7,
                            child: Center(
                                child: Text(
                              'Hey, my name is Bayu nugroho',
                              style: TextStyle(
                                  fontSize: (Get.height / 100) * 2.5, color: white),
                            )),
                          ),
                        ),
                      ),
                    ),
                  ),
                  BouncingWidget(
                    duration: Duration(milliseconds: 100),
                    scaleFactor: 1.5,
                    onPressed: () {

                    },
                    child: Image.asset(
                      "assets/images/redbull.png",
                      width: Get.width / 2.6,
                      height: Get.height / 7,
                      fit: BoxFit.fill,
                    ),
                  )
                ],
              ),
            ),
            GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20),
                itemCount: controller.itemList.length,
                itemBuilder: (BuildContext ctx, index) {
                  return FadeInUp(
                    delay: Duration(seconds: 1),
                    child: BouncingWidget(
                      duration: Duration(milliseconds: 100),
                      scaleFactor: 1.5,
                      onPressed: () {

                      },
                      child: Card(
                        elevation: 3,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Container(
                          height: 90,
                          child: Center(
                            child: Text(
                              '${controller.itemList[index].name}',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: (Get.height / 100) * 2.5,
                                  color: grey),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
