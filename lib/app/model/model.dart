import 'package:flutter/material.dart';

/**
 * Created by Bayu Nugroho
 * Copyright (c) 2021 . All rights reserved.
 */

class Item {
  int? id;
  String? name;

  Item({this.id, this.name});
}

class ConcertricModel {
  String? title;
  String? image;
  Color? bgColor;
  Color? textColor;

  ConcertricModel({
    this.title,
    this.image,
    this.bgColor = Colors.white,
    this.textColor = Colors.black,
  });
}
