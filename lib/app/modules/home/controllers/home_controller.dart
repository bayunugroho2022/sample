import 'package:bayu_flutter/app/model/model.dart';
import 'package:bayu_flutter/app/routes/app_pages.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final itemList = <Item>[].obs;
  final count = 0.obs;

  @override
  void onInit() {
    setItem();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void increment() => count.value++;

  void onTap(int id) {
    if (id == 1) {
      Get.toNamed(Routes.CONCERTRIC);
    } else if (id == 2) {
      Get.toNamed(Routes.SHIRT);
    } else if (id == 3) {
    } else if (id == 4) {}
  }

  void setItem() {
    itemList.add(Item(id: 1, name: "concentric\ntransition"));
    itemList.add(Item(id: 2, name: "Jersey UI"));
    itemList.add(Item(id: 3, name: "coming soon"));
    itemList.add(Item(id: 4, name: "coming soon"));
    itemList.add(Item(id: 5, name: "coming soon"));
    itemList.add(Item(id: 6, name: "coming soon"));
    itemList.add(Item(id: 7, name: "coming soon"));
    itemList.add(Item(id: 8, name: "coming soon"));
    itemList.add(Item(id: 9, name: "coming soon"));
    itemList.add(Item(id: 10, name: "coming soon"));
    update();
  }
}
