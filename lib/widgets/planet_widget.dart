library planet_widget;

import 'dart:collection';
import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

part '../painter/draw_circle_painter.dart';

part 'draw_circle_widgets.dart';

part '../constants/enum.dart';

part 'tween_builder_widget.dart';

late Offset _circleCenter;

double _radius = 0;
double _firstRadius = 0;
double _secondRadius = 0;
double _thirdRadius = 0;

class PlanetWidget extends StatefulWidget {
  /// Visibility of first circle.
  /// It contains bool value.
  ///
  /// true = visible,
  ///
  /// false = invisible.
  final bool visibleFirstCircle;

  /// Visibility of second circle.
  /// It contains bool value.
  ///
  /// true = visible,
  ///
  /// false = invisible.
  final bool visibleSecondCircle;

  /// Visibility of third circle.
  /// It contains bool value.
  ///
  /// true = visible,
  ///
  /// false = invisible.
  final bool visibleThirdCircle;

  /// Displays the first circle based on radius.
  /// Radius starts from center.
  ///
  /// It contains the double value.
  final double firstCircleRadius;

  /// Displays the second circle based on radius.
  /// Radius starts from center.
  ///
  /// It contains the double value.
  final double secondCircleRadius;

  /// Displays the third circle based on radius.
  /// Radius starts from center.
  ///
  /// It contains the double value.
  final double thirdCircleRadius;

  /// Displays the first circle widgets based on radians calculation.
  ///
  /// It contains the double value.
  final double firstCircleRadians;

  /// Displays the second circle widgets based on radians calculation.
  ///
  /// It contains the double value.
  final double secondCircleRadians;

  /// Displays the third circle widgets based on radians calculation.
  ///
  /// It contains the double value.
  final double thirdCircleRadians;

  /// Displays the first circle widgets.
  /// It contains the List of Widgets.
  final List<Widget>? firstCircleWidgets;

  /// Displays the second circle widgets.
  /// It contains the List of Widgets.
  final List<Widget>? secondCircleWidgets;

  /// Displays the third circle widgets.
  /// It contains the List of Widgets.
  final List<Widget>? thirdCircleWidgets;

  /// Displays the widget at center of circle.
  /// It contains the Widget.
  final Widget? centerWidget;

  /// Change the all circles stroke(line) color.
  /// It contains Color value.
  ///
  /// Default value is Colors.black
  final Color allCircleStrokeColor;

  /// Change the first circle stroke(line) color.
  /// It contains Color value.
  /// Default value is Colors.black
  final Color? firstCircleStrokeColor;

  /// Change the second circle stroke(line) color.
  /// It contains Color value.
  /// Default value is Colors.black
  final Color? secondCircleStrokeColor;

  /// Change the third circle stroke(line) color.
  /// It contains Color value.
  /// Default value is Colors.black
  final Color? thirdCircleStrokeColor;

  /// Change the all circles stroke(line) width.
  /// It contains double value.
  /// Default value is 1.0
  final double allCircleStrokeWidth;

  /// Change the first circle stroke(line) width.
  /// It contains double value.
  /// Default value is 1.0
  final double firstCircleStrokeWidth;

  /// Change the second circle stroke(line) width.
  /// It contains double value.
  /// Default value is 1.0
  final double secondCircleStrokeWidth;

  /// Change the third circle stroke(line) width.
  /// It contains double value.
  /// Default value is 1.0
  final double thirdCircleStrokeWidth;

  /// Create the animation in planet widget.
  /// it contains bool value:
  ///
  /// true = display the planets with animation
  ///
  /// false = display the planets without animation
  final bool startAnimation;

  /// Repeat the animation in planet widget.
  /// This parameter affects when [startAnimation] is true.
  /// it contains bool value.
  ///
  /// true = repeat the animation.
  ///
  /// false = show animation only for one time.
  final bool repeatAnimation;

  /// Set the animation duration in seconds for all circles.
  /// This parameter affects when [startAnimation] is true.
  ///
  /// It contains [int] value.
  final int defaultCircleAnimationDuration;

  /// Set the animation duration in seconds for the first circle.
  /// This parameter affects when [startAnimation] is true.
  ///
  /// it contains [int] value.
  final int firstCircleAnimationDuration;

  /// Set the animation duration in seconds for the second circle.
  /// This parameter affects when [startAnimation] is true.
  ///
  /// it contains [int] value.
  final int secondCircleAnimationDuration;

  /// Set the animation duration in seconds for the third circle.
  /// This parameter affects when [startAnimation] is true.
  ///
  /// it contains [int] value.
  final int thirdCircleAnimationDuration;

  ///  [Curves], a collection of common animation easing curves.
  ///  [CurveTween], which can be used to apply a [Curve] to an [Animation].
  ///
  /// Default value is Curves.linear
  final Curve curve;

  final GlobalKey<_DrawCircleWidgetsState> _drawCircleWidgetsKey = GlobalKey();

  /// Create a planet Widget.
  ///
  /// All the arguments for You can customize your [PlanetWidget] as per your requirements.
  PlanetWidget({
    this.centerWidget,
    this.firstCircleWidgets,
    this.secondCircleWidgets,
    this.thirdCircleWidgets,
    this.firstCircleRadius = 20,
    this.secondCircleRadius = 40,
    this.thirdCircleRadius = 40,
    this.firstCircleRadians = 0,
    this.secondCircleRadians = 0.5,
    this.thirdCircleRadians = 1,
    this.visibleFirstCircle = true,
    this.visibleSecondCircle = true,
    this.visibleThirdCircle = true,
    this.allCircleStrokeColor = Colors.black,
    this.firstCircleStrokeColor,
    this.secondCircleStrokeColor,
    this.thirdCircleStrokeColor,
    this.allCircleStrokeWidth = 1,
    this.firstCircleStrokeWidth = -1,
    this.secondCircleStrokeWidth = -1,
    this.thirdCircleStrokeWidth = -1,
    this.startAnimation = false,
    this.repeatAnimation = false,
    this.firstCircleAnimationDuration = -1,
    this.secondCircleAnimationDuration = -1,
    this.thirdCircleAnimationDuration = -1,
    this.defaultCircleAnimationDuration = 8,
    this.curve = Curves.linear,
    Key? key,
  }) : super(key: key);

  @override
  _PlanetWidgetState createState() => _PlanetWidgetState();

 void startCircleAnimation() {
    _drawCircleWidgetsKey.currentState?.startCircleAnimation();
  }

  void stopCircleAnimation() {
    _drawCircleWidgetsKey.currentState?.resetCircleAnimation();
  }

}

class _PlanetWidgetState extends State<PlanetWidget> {
  ValueNotifier<bool> isCirclesDrawn = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: DrawCirclePainter(
          visibleFirstCircle: widget.visibleFirstCircle,
          visibleSecondCircle: widget.visibleSecondCircle,
          visibleThirdCircle: widget.visibleThirdCircle,
          allCircleStrokeColor: widget.allCircleStrokeColor,
          firstCircleStrokeColor: widget.firstCircleStrokeColor,
          secondCircleStrokeColor: widget.secondCircleStrokeColor,
          thirdCircleStrokeColor: widget.thirdCircleStrokeColor,
          allCircleStrokeWidth: widget.allCircleStrokeWidth,
          firstCircleStrokeWidth: widget.firstCircleStrokeWidth,
          secondCircleStrokeWidth: widget.secondCircleStrokeWidth,
          thirdCircleStrokeWidth: widget.thirdCircleStrokeWidth,
          firstCircleRadius: widget.firstCircleRadius,
          secondCircleRadius: widget.secondCircleRadius,
          thirdCircleRadius: widget.thirdCircleRadius,
          onDrawCompleteCallback: () {
            setSchedulerForCircleDrawn();
          }),
      child: ValueListenableBuilder(
        builder: (BuildContext context, bool value, Widget? child) {
          return (value) ? _buildCircleWidgets() : Container();
        },
        valueListenable: isCirclesDrawn,
      ),
    );
  }

  void setSchedulerForCircleDrawn() {
    WidgetsBinding.instance?.addPostFrameCallback(
      (timeStamp) {
        _buildCircleWidgets();
        isCirclesDrawn.value = true;
      },
    );
  }

  Widget _buildCircleWidgets() {
    return DrawCircleWidgets(
      key: widget._drawCircleWidgetsKey,
      centerWidget: widget.centerWidget,
      firstCircleWidgets: widget.firstCircleWidgets,
      secondCircleWidgets: widget.secondCircleWidgets,
      thirdCircleWidgets: widget.thirdCircleWidgets,
      firstCircleRadians: widget.firstCircleRadians,
      secondCircleRadians: widget.secondCircleRadians,
      thirdCircleRadians: widget.thirdCircleRadians,
      startAnimation: widget.startAnimation,
      repeatAnimation: widget.repeatAnimation,
      firstCircleAnimationDuration: widget.firstCircleAnimationDuration,
      secondCircleAnimationDuration: widget.secondCircleAnimationDuration,
      thirdCircleAnimationDuration: widget.thirdCircleAnimationDuration,
      allCircleAnimationDuration: widget.defaultCircleAnimationDuration,
      curve: widget.curve,
    );
  }
}
