import 'package:bayu_flutter/app/model/model.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_shirt_controller.dart';

// ignore: must_be_immutable
class DetailShirtView extends GetView<DetailShirtController> {
  Shirt? shirt;
  String? tagImage;

  DetailShirtView({this.shirt, this.tagImage});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: size.height / 6),
            child: Hero(
                tag: tagImage!,
                child: Center(
                    child: Image.asset(
                      shirt!.image!,
                      height: size.height / 3,
                    ))),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            shirt!.name!,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            shirt!.price!,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 25),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            shirt!.desc!,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15),
          ),
        ],
      ),
    );
  }
}
