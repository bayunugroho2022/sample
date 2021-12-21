import 'package:bayu_flutter/app/model/model.dart';
import 'package:flutter/material.dart';

/**
 * Created by Bayu Nugroho
 * Copyright (c) 2021 . All rights reserved.
 */
class PageCard extends StatelessWidget {
  final ConcertricModel page;

  const PageCard({
    Key? key,
    required this.page,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 30.0,
      ),
      child: Column(
        children: <Widget>[
          _buildPicture(context),
          SizedBox(height: 30),
          _buildText(context),
        ],
      ),
    );
  }

  Widget _buildText(BuildContext context) {
    return Text(
      page.title!,
      style: Theme.of(context).textTheme.headline6,
      textAlign: TextAlign.center,
    );
  }

  Widget _buildPicture(
      BuildContext context, {
        double size = 300}) {
    return Container(
      width: size,
      height: size,
      margin: EdgeInsets.only(
        top: 140,
      ),
      child: Image.asset(page.image!),
    );
  }
}