import 'package:bayu_flutter/app/modules/business/business.dart';
import 'package:bayu_flutter/app/modules/shirt/views/shirt_view.dart';
import 'package:bayu_flutter/app/utils/state_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum Tab { shirt, business }

class StateCustomController extends StatexController {
  final currentIndex = 0.obs;
  final selectedTab$ = Tab.shirt.obs;
  final pageController = PageController();

  List<Widget> pages = [
    ShirtView(),
    BusinessPage(),
  ];

  Widget get currentPage => pages[currentIndex.value];

  void changePage(int _index) {
    currentIndex.value = _index;
  }

  void toPage(int index) {
    selectedTab$(Tab.values.elementAt(index));
    Future.delayed(Duration.zero).then((_) {
      pageController.jumpToPage(
        index,
      );
    });
  }

  @override
  void onInit() {
    print('iniiits main controller');
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

}