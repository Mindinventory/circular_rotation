library planet_widget;

import 'dart:async';
import 'dart:collection';
import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:planet_widget/widgets/planet_widget_body.dart';

part 'common/globals.dart';

part 'constants/colors.dart';

part 'constants/enum.dart';

part 'model/planet_widget_inherited_model.dart';

part 'model/planet_widget_model.dart';

part 'painter/draw_circle_painter.dart';

part 'util/tween_animation_handler.dart';

part 'widgets/circle_widget_center.dart';

part 'widgets/circle_widgets_first.dart';

part 'widgets/circle_widgets_second.dart';

part 'widgets/circle_widgets_third.dart';

part 'widgets/tween_builder_widget.dart';

class PlanetWidget extends StatelessWidget {
  /// You have to set property for the planet widget.
  /// You can configure as per your requirements.
  final PlanetWidgetModel planetWidgetProperty;

  /// Create a planet Widget.
  ///
  /// All the arguments for You can customize your [PlanetWidget] as per your requirements.
  const PlanetWidget({
    required this.planetWidgetProperty,
    Key? key,
  }) : super(key: key);

  static void startCircleAnimation() {
    controllerUserAction.add(CircleAnimationStatus.start);
  }

  static void stopCircleAnimation() {
    controllerUserAction.add(CircleAnimationStatus.stop);
  }

  static void eitherStartOrStopAnimation(){
    controllerUserAction.add(CircleAnimationStatus.startStop);
  }

  void _updateCircleAnimationsWidget(){
    controllerUserAction.add(CircleAnimationStatus.refreshScreen);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        _updateCircleAnimationsWidget();
        return PlanetWidgetInheritedModel(
          planetWidgetModel: planetWidgetProperty,
          child: const PlanetWidgetBody(),
        );
      },
    );
  }
}