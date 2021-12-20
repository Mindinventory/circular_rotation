library circular_rotation;

import 'dart:async';
import 'dart:collection';
import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:circular_rotation/extensions/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'constants/dimens.dart';

part 'common/globals.dart';

part 'constants/colors.dart';

part 'constants/enum.dart';

part 'model/circular_rotation_inherited_model.dart';

part 'model/circular_rotation_model.dart';

part 'painter/draw_circle_painter.dart';

part 'widgets/calculate_position_widget.dart';

part 'widgets/circle_widget_center.dart';

part 'widgets/circle_widgets_first.dart';

part 'widgets/circle_widgets_second.dart';

part 'widgets/circle_widgets_third.dart';

part 'widgets/circular_rotation_body.dart';

part 'widgets/tween_builder_widget.dart';

class CircularRotation extends StatelessWidget {
  /// You have to set property for the Circular Rotation.
  /// You can configure as per your requirements.
  final CircularRotationModel circularRotationProperty;

  /// Create a circular Rotation.
  ///
  /// All the arguments for You can customize your [CircularRotation] as per your requirements.
  const CircularRotation({
    required this.circularRotationProperty,
    Key? key,
  }) : super(key: key);

  static void startCircleAnimation() {
    controllerUserAction.add(CircleAnimationStatus.start);
  }

  static void stopCircleAnimation() {
    controllerUserAction.add(CircleAnimationStatus.stop);
  }

  static void eitherStartOrStopAnimation() {
    controllerUserAction.add(CircleAnimationStatus.startStop);
  }

  void _updateCircleAnimationsWidget() {
    controllerUserAction.add(CircleAnimationStatus.refreshScreen);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        _updateCircleAnimationsWidget();
        return CircularRotationInheritedModel(
          circularRotationModel: circularRotationProperty,
          child: const CircularRotationBody(),
        );
      },
    );
  }
}
