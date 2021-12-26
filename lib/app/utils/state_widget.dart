import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

/**
 * Created by Bayu Nugroho
 * Copyright (c) 2021 . All rights reserved.
 */

/// [StatexWidget] helps to manage [GetxController]s lifecycle
/// according its [Widget]s in cases when [Getx] doesn't.
///
/// Examples:
/// 1. PageView.childs[Widget1(), Widget2(), ...]
/// 2. Get.bottomSheet(Widget())
///
/// These usecases aren't page routing cases, so Getx doesn't call
/// onInit, onReady, onDelete in GetxControllers.
///
/// Pros:
/// - auto creating/deleting controllers when widget is initialized/disposed;
/// - works alongside standard Getx binding, so one can mix these tools;
/// - works with tags;
/// - works with permanent;
/// - allows use lazyPut;
///
/// How does it work:
///
/// 1. Inherit SomeController from [StatexController]
/// 2. Inherit SomeWidget from [StatexWidget]
/// 3a. Call base constructor with simple SomeController factory
///     as a parameter or
/// 3.b Call base constructor [super.lazyAdjust] if there is Get.lazyPut
///     somewhere in the code
/// 4. Realize [StatexWidget.buildWidget] insted of [Widget.build]
///
/// ```
/// [1]
/// class _HomeSubPageController extends StatexController {}
///
/// [2]
/// class HomeSubPage extends StatexWidget<_HomeSubPageController> {
/// [3.a]
//   HomeSubPage({Key? key}) : super(() => _HomeSubPageController(), key: key);
/// [3.b]
//   HomeSubPage({Key? key}) : super.lazyAdjust( ... );
//
/// [4]
//   @override
//   Widget buildWidget(BuildContext context) => Container();
// }
/// ```
///
/// That's all. Now `onInit/onReady/onClose` of controller will been called
/// on time when widget will inserted in widget tree or destroyed with them.
///
/// If one need to catch points of [WidgetState.initState],
/// [WidgetState.disposed] one should override
/// [StatexController.onWidgetInitState] and [StatexController.onWidgetDisposed].
///
/// Tag and permanent.
///
/// Be free to pass [tag] and [permanent] as usual:
///
/// ```
/// /// Controller now is permanent:
/// class HomePage extends StatexWidget<_HomePageController> {
///   HomePage({Key? key})
///       : super(
///           () => _HomePageController(),
///           permanent: true,
///           key: key,
///         );
///
/// /// Controller now has tag
/// class BusinessPage extends StatexWidget<_BusinessPageController> {
//   BusinessPage() : super(() => _BusinessPageController(), tag: '_\$myTag');
/// ```
///
abstract class StatexWidget<T extends StatexController>
    extends StatelessWidget {
  /// Base constructor.
  /// Does calling Get.put(...) under the hood, passing parameters if needed.
  /// ```
  /// class BusinessPage extends StatexWidget<_BusinessPageControllerImpl> {
  ///   BusinessPage() : super(() => _BusinessPageControllerImpl(),
  ///     tag: 'TAG', permanent: true, args: {'key': value} );
  /// ```
  /// Simplifies things but doesn't support Dependency Inversion Principle
  /// as one need to know the type right in this point.
  const StatexWidget(
      this.builder, {
        this.tag,
        this.permanent = false,
        this.args = const <String, dynamic>{},
        Key? key,
      }) : super(key: key);

  /// Named constructor for `Get.lazyPut<Some>(()=>SomeImpl())` concept.
  ///
  /// Here is usecase:
  /// ```
  ///   // Somewhere put factory with parameter `fenix = true`
  ///   Get.lazyPut<HomePageController>(
  ///     () => HomePageControllerImpl(),
  ///     fenix: true,
  ///   );
  ///
  ///   // Use [StatexWidget.lazyAdjust] instead of base constructor.
  ///   class HomePage extends StatexWidget<HomePageController> {
  ///     HomePage({Key? key}) : super.lazyAdjust(
  ///           markAsPermanent: true,
  ///           key: key,
  ///   );
  ///
  /// ```
  /// [tag] passing tag directly to Get.put when needed
  /// [markAsPermanent] this constructor most likely will be called for
  ///                   `Get.lazyPut` so no parameter `permanent` for that case.
  ///                   `markAsPermanent` emulates `permanent` for that case.
  /// [args] extra argument map
  ///
  const StatexWidget.lazyAdjust({
    String? tag,
    bool markAsPermanent = false,
    Map<String, dynamic> args = const <String, dynamic>{},
    Key? key,
  }) : this(null, tag: tag, permanent: markAsPermanent, args: args, key: key);

  /// [builder] is required for base constructor but not for [lazyAdjust]
  final InstanceBuilderCallback<T>? builder;

  final String? tag;
  final bool permanent;
  final Map<String, dynamic> args;

  T get controller => GetInstance().find<T>(tag: tag);

  Widget buildWidget(BuildContext context);

  /// Main goal is to inject [_StatexControllerManager] behind
  /// main working widget tree and to design it as tiny as it can be.
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.passthrough,
      children: [
        Wrap(
          children: [
            // Wrapping makes things tiny
            _StatexControllerManager<T>(
              builder,
              tag: tag,
              permanent: permanent,
              args: args,
            ),
          ],
        ),
        buildWidget(context),
      ],
    );
  }
}

/// Manager that links lifecycles for both Widget and its controller.
class _StatexControllerManager<T extends StatexController> extends StatefulWidget {
  _StatexControllerManager(
      InstanceBuilderCallback<T>? builder, {
        this.tag,
        this.permanent = false,
        Map<String, dynamic> args = const <String, dynamic>{},
        Key? key,
      }) : super(key: key) {
    final inst = GetInstance();
    if (builder != null && !inst.isRegistered<T>(tag: tag)) {
      // Injecting the instance right here if needed.
      inst.put(builder(), tag: tag, permanent: permanent);
    }
    final c = inst.find<T>(tag: tag);
    c.args = args;
  }

  final String? tag;
  final bool permanent;

  @override
  _StatexControllerManagerState<T> createState() =>
      _StatexControllerManagerState<T>();
}

/// State for [_StatexControllerManager].
/// It manages [onWidgetDisposed], [onWidgetDisposed]
/// and deletes controller instance if needed.
class _StatexControllerManagerState<T extends StatexController>
    extends State<_StatexControllerManager<T>> {
  @override
  initState() {
    super.initState();
    final wc = GetInstance().find<T>(tag: widget.tag);
    wc.onWidgetInitState();
  }

  @override
  void dispose() {
    final inst = GetInstance();
    if (inst.isRegistered<T>(tag: widget.tag)) {
      final wc = inst.find<T>(tag: widget.tag);
      wc.onWidgetDisposed();
      if (!widget.permanent) {
        Get.delete<T>(tag: widget.tag);
      }
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Container();
}

/// Specialized controller for [StatexWidget].
/// In a simplest case just inherit from it and nothing more.
/// It has useful events [onWidgetInitState], [onWidgetDisposed]
/// that are called at the right time.
abstract class StatexController extends GetxController {
  final _args = <String, dynamic>{};

  Map<String, dynamic> get args => _args;

  set args(Map<String, dynamic> value) => _args.assignAll(value);

  /// It is called at the [_StatexControllerManagerState.initState].
  /// So one can catch entering View for example.
  void onWidgetInitState() {}

  /// It is called at the [_StatexControllerManagerState.dispose].
  /// So one can catch leaving View for example.
  void onWidgetDisposed() {}
}

