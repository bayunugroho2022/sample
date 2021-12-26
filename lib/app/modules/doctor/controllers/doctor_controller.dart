
import 'package:bayu_flutter/app/utils/state_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


enum Tab { home, business }

class DoctorController extends StatexController {
  final selectedTab$ = Tab.home.obs;

  final pageController = PageController();

  void toPage(int index) {
    selectedTab$(Tab.values.elementAt(index));
    Future.delayed(Duration.zero).then((_) {
      pageController.animateToPage(
        index,
        curve: Curves.ease,
        duration: const Duration(milliseconds: 500),
      );
    });
  }
}

// import 'package:bayu_flutter/app/modules/concertric/views/concertric_view.dart';
// import 'package:bayu_flutter/app/modules/shirt/views/shirt_view.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class DoctorController extends GetxController {
//   static DoctorController get to => Get.find();
//   final currentIndex = 0.obs;
//
//   List<Widget> pages = [
//     ShirtView(),
//     ConcertricView(),
//   ];
//
//   Widget get currentPage => pages[currentIndex.value];
//
//   void changePage(int _index) {
//     currentIndex.value = _index;
//   }
//   @override
//   void onInit() {
//     super.onInit();
//   }
//
//   @override
//   void onReady() {
//     super.onReady();
//   }
//
//
//
//   @override
//   void onClose() {}
//
// }


