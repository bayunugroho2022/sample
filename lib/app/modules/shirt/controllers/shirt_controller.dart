import 'package:bayu_flutter/app/model/model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShirtController extends GetxController {
  final listShirt = <Shirt>[].obs;
  final pageShirtController = PageController(viewportFraction: 0.35);
  final pageTextController = PageController();
  final currentPage = 0.0.obs;
  final textPage = 0.0.obs;

  final count = 0.obs;

  void iceCreamScrollListener() {
      currentPage.value = pageShirtController.page!;
      update();
  }

  void textScrollListener() {
      textPage.value = currentPage.value;
      update();
  }


  @override
  void onInit() {
    print('init shirt');
    addShirt();
    pageShirtController.addListener(iceCreamScrollListener);
    pageTextController.addListener(textScrollListener);
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  void addShirt() {
    listShirt.add(new Shirt(
      name: "Nike Jersey",
      price: "Rp.100.000",
      image: "assets/images/s1.png",
      desc:
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
    ));
    listShirt.add(new Shirt(
      name: "Adidas Jersey",
      price: "Rp.200.000",
      image: "assets/images/ss3.png",
      desc:
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
    ));
    listShirt.add(new Shirt(
      name: "Puma Jersey",
      price: "Rp.300.000",
      image: "assets/images/ss4.png",
      desc:
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
    ));
    listShirt.add(new Shirt(
      name: "Diadora Jersey",
      price: "Rp.400.000",
      image: "assets/images/s1.png",
      desc:
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
    ));
    listShirt.add(new Shirt(
      name: "Nike Jersey",
      price: "Rp.100.000",
      image: "assets/images/s1.png",
      desc:
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
    ));
    listShirt.add(new Shirt(
      name: "Adidas Jersey",
      price: "Rp.200.000",
      image: "assets/images/ss3.png",
      desc:
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
    ));
    listShirt.add(new Shirt(
      name: "Puma Jersey",
      price: "Rp.300.000",
      image: "assets/images/ss4.png",
      desc:
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
    ));
    listShirt.add(new Shirt(
      name: "Diadora Jersey",
      price: "Rp.400.000",
      image: "assets/images/s1.png",
      desc:
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
    ));
    update();
}
}
