part of planet_widget;

class PlanetWidgetModel extends InheritedModel<String> {
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

  final Widget child;

  const PlanetWidgetModel(
      {required this.visibleFirstCircle,
      required this.visibleSecondCircle,
      required this.firstCircleRadius,
      required this.visibleThirdCircle,
      required this.secondCircleRadius,
      required this.thirdCircleRadius,
      required this.firstCircleRadians,
      required this.secondCircleRadians,
      required this.thirdCircleRadians,
      this.firstCircleWidgets,
      this.secondCircleWidgets,
      this.thirdCircleWidgets,
      this.centerWidget,
      required this.allCircleStrokeColor,
      this.firstCircleStrokeColor,
      this.secondCircleStrokeColor,
      this.thirdCircleStrokeColor,
      required this.allCircleStrokeWidth,
      required this.firstCircleStrokeWidth,
      required this.secondCircleStrokeWidth,
      required this.thirdCircleStrokeWidth,
      required this.startAnimation,
      required this.repeatAnimation,
      required this.defaultCircleAnimationDuration,
      required this.firstCircleAnimationDuration,
      required this.secondCircleAnimationDuration,
      required this.thirdCircleAnimationDuration,
      required this.curve,
      required this.child,
      Key? key})
      : super(key: key, child: child);

  static PlanetWidgetModel of(BuildContext context,) {
    PlanetWidgetModel? planetWidgetModel = InheritedModel.inheritFrom<PlanetWidgetModel>(context);
    assert(planetWidgetModel!=null, 'PlanetWidgetModel not initialized');
    return planetWidgetModel!;
  }

  @override
  bool updateShouldNotify(covariant PlanetWidgetModel old) {
    return visibleFirstCircle != old.visibleFirstCircle ||
        visibleSecondCircle != old.visibleSecondCircle ||
        visibleThirdCircle != old.visibleThirdCircle ||
        firstCircleRadius != old.firstCircleRadius ||
        secondCircleRadius != old.secondCircleRadius ||
        thirdCircleRadius != old.thirdCircleRadius ||
        firstCircleRadians != old.firstCircleRadians ||
        secondCircleRadians != old.secondCircleRadians ||
        thirdCircleRadians != old.thirdCircleRadians ||
        firstCircleWidgets != old.firstCircleWidgets ||
        secondCircleWidgets != old.secondCircleWidgets ||
        thirdCircleWidgets != old.thirdCircleWidgets ||
        centerWidget != old.centerWidget ||
        allCircleStrokeColor != old.allCircleStrokeColor ||
        firstCircleStrokeColor != old.firstCircleStrokeColor ||
        secondCircleStrokeColor != old.secondCircleStrokeColor ||
        thirdCircleStrokeColor != old.thirdCircleStrokeColor ||
        allCircleStrokeWidth != old.allCircleStrokeWidth ||
        firstCircleStrokeWidth != old.firstCircleStrokeWidth ||
        secondCircleStrokeWidth != old.secondCircleStrokeWidth ||
        thirdCircleStrokeWidth != old.thirdCircleStrokeWidth ||
        startAnimation != old.startAnimation ||
        repeatAnimation != old.repeatAnimation ||
        defaultCircleAnimationDuration != old.defaultCircleAnimationDuration ||
        firstCircleAnimationDuration != old.firstCircleAnimationDuration ||
        secondCircleAnimationDuration != old.secondCircleAnimationDuration ||
        thirdCircleAnimationDuration != old.thirdCircleAnimationDuration ||
        curve != old.curve;
  }

  @override
  bool updateShouldNotifyDependent(
      covariant PlanetWidgetModel old, Set dependencies) {
    return visibleFirstCircle != old.visibleFirstCircle ||
        visibleSecondCircle != old.visibleSecondCircle ||
        visibleThirdCircle != old.visibleThirdCircle ||
        firstCircleRadius != old.firstCircleRadius ||
        secondCircleRadius != old.secondCircleRadius ||
        thirdCircleRadius != old.thirdCircleRadius ||
        firstCircleRadians != old.firstCircleRadians ||
        secondCircleRadians != old.secondCircleRadians ||
        thirdCircleRadians != old.thirdCircleRadians ||
        firstCircleWidgets != old.firstCircleWidgets ||
        secondCircleWidgets != old.secondCircleWidgets ||
        thirdCircleWidgets != old.thirdCircleWidgets ||
        centerWidget != old.centerWidget ||
        allCircleStrokeColor != old.allCircleStrokeColor ||
        firstCircleStrokeColor != old.firstCircleStrokeColor ||
        secondCircleStrokeColor != old.secondCircleStrokeColor ||
        thirdCircleStrokeColor != old.thirdCircleStrokeColor ||
        allCircleStrokeWidth != old.allCircleStrokeWidth ||
        firstCircleStrokeWidth != old.firstCircleStrokeWidth ||
        secondCircleStrokeWidth != old.secondCircleStrokeWidth ||
        thirdCircleStrokeWidth != old.thirdCircleStrokeWidth ||
        startAnimation != old.startAnimation ||
        repeatAnimation != old.repeatAnimation ||
        defaultCircleAnimationDuration != old.defaultCircleAnimationDuration ||
        firstCircleAnimationDuration != old.firstCircleAnimationDuration ||
        secondCircleAnimationDuration != old.secondCircleAnimationDuration ||
        thirdCircleAnimationDuration != old.thirdCircleAnimationDuration ||
        curve != old.curve;
  }
}
