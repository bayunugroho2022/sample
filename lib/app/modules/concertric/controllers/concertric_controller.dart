import 'package:bayu_flutter/app/model/model.dart';
import 'package:bayu_flutter/app/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConcertricController extends GetxController {
  final List<ConcertricModel> pages = [
    ConcertricModel(
      image: "assets/images/concer1.png",
      title: "\"System programmers are the high priests of a low cult\"\n\nRobert S. Barton",
      textColor: white,
      bgColor: concerBg1,
    ),
    ConcertricModel(
      image: "assets/images/concer2.png",
      title: "\"Don't comment bad code\"\n\n-Brian Kernighan",
      bgColor: concerBg2,
    ),
    ConcertricModel(
      image: "assets/images/concer3.png",
      title: "\"We have to stop optimizing for programmers and start optimizing for users.\"\n\nJeff Atwood",
      bgColor: concerBg3,
      textColor: white,
    ),
  ];

  List<Color> get colors => pages.map((p) => p.bgColor!).toList();

  final count = 0.obs;
  @override
  void onInit() {
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
