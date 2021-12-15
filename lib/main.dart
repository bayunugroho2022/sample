import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      theme: ThemeData(
        fontFamily: 'QuickSand',
        primarySwatch: Colors.pink,
      ),
      title: "Bayu Apps",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
