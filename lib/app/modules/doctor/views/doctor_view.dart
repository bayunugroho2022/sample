import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/doctor_controller.dart';

class DoctorView extends GetView<DoctorController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Container(
        width: Get.width,
        height: Get.height,
        child: Stack(
          children: [
            Positioned(
                bottom: 0,
                right: -90,
                child: Image.asset(
                  "assets/images/doctor.PNG",
                  width: 400,
                  height: Get.height / 1.7,
                  fit: BoxFit.fitHeight,
                )),
            Positioned(
                right: Get.width / 9,
                top: Get.height / 6,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Compleate\nHealt\nSolution',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Lorem Ipsum is simply dummy text of\nthe printing and typesetting industry.',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),

                  ],
                )),
          ],
        ),
      ),
    );
  }
}
