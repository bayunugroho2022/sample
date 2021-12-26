import 'dart:async';

import 'package:bayu_flutter/app/utils/state_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BusinessPage extends StatexWidget<_BusinessPageController> {
  BusinessPage() : super(() => _BusinessPageController(), tag: '_\$myTag') {
  }

  @override
  Widget buildWidget(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            runtimeType.toString(),
            style: Theme.of(context).textTheme.headline5,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Timer REINITIALIZES every time\n'
              'when initializes widget and controller',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.subtitle2,
            ),
          ),
          Obx(() => Text(
                '${controller.timerTitle$}',
                style: Theme.of(context).textTheme.headline4,
              )),
          // _TestWidget(),
        ],
      ),
    );
  }
}

class _BusinessPageController extends StatexController {
  _BusinessPageController() {
    debugPrint(' _BusinessPageController._BusinessPageController');
  }

  final _timerTitle = 1.obs;

  get timerTitle$ => _timerTitle.value;

  late Timer _timer;

  @override
  void onWidgetInitState() {
    super.onWidgetInitState();
    debugPrint(' _BusinessPageController.onWidgetInitState');
    _timer = Timer.periodic(Duration(seconds: 1), (_) {
      _timerTitle.value++;
    });
  }

  @override
  void onWidgetDisposed() {
    debugPrint(' _BusinessPageController.onWidgetDisposed');
    super.onWidgetDisposed();
  }

  @override
  void onInit() {
    super.onInit();
    debugPrint('_BusinessPageController.onInit ---------------------------------');
  }

  @override
  void onReady() {
    super.onReady();
    debugPrint(' _BusinessPageController.onReady');
  }

  @override
  void onClose() {
    debugPrint(' _BusinessPageController.onClose');
    _timer.cancel();
    super.onClose();
  }
}
