import 'package:bayu_flutter/app/utils/state_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/state_custom_controller.dart';


class StateCustomView extends StatexWidget<StateCustomController> {
  StateCustomView() : super(() => StateCustomController());

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Get.width,
        height: Get.height,
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  InkWell(
                    onTap: (){
                      controller.toPage(0);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Jersey UI'),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      controller.toPage(1);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('State Example'),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 7,
              child: PageView(
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                controller: controller.pageController,
                children: controller.pages,
              ),
            ),
          ],
        ),
      ),
    );
  }
  }