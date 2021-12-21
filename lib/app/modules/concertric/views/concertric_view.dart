import 'package:bayu_flutter/app/model/model.dart';
import 'package:bayu_flutter/app/modules/concertric/views/widgets/page_card.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/concertric_controller.dart';
import 'widgets/concerntric_page_view.dart';

class ConcertricView extends GetView<ConcertricController> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ConcentricPageView(
          colors: controller.colors,
          radius: 30,
          curve: Curves.ease,
          duration: Duration(seconds: 2),
          itemBuilder: (index, value) {
            ConcertricModel page = controller.pages[index % controller.pages.length];
            return Container(
              child: Theme(
                data: ThemeData(
                  textTheme: TextTheme(
                    headline6: TextStyle(
                      color: page.textColor,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Helvetica',
                      letterSpacing: 0.0,
                      fontSize: 17,
                    ),
                    subtitle2: TextStyle(
                      color: page.textColor,
                      fontWeight: FontWeight.w300,
                      fontSize: 18,
                    ),
                  ),
                ),
                child: PageCard(page: page),
              ),
            );
          },
        ),
      ),
    );
  }
}