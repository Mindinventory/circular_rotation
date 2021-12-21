part of circular_rotation;

class CircularRotationModel {
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
  double? firstCircleRadius;

  /// Displays the second circle based on radius.
  /// Radius starts from center.
  ///
  /// It contains the double value.
  double? secondCircleRadius;

  /// Displays the third circle based on radius.
  /// Radius starts from center.
  ///
  /// It contains the double value.
  double? thirdCircleRadius;

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
  final Color defaultCircleStrokeColor;

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
  final double defaultCircleStrokeWidth;

  /// Change the first circle stroke(line) width.
  /// It contains double value.
  /// Default value is 1.0
  final double? firstCircleStrokeWidth;

  /// Change the second circle stroke(line) width.
  /// It contains double value.
  /// Default value is 1.0
  final double? secondCircleStrokeWidth;

  /// Change the third circle stroke(line) width.
  /// It contains double value.
  /// Default value is 1.0
  final double? thirdCircleStrokeWidth;

  /// Create the animation in circular rotation.
  /// it contains bool value:
  ///
  /// true = display the circular widgets with animation
  ///
  /// false = display the circular widgets without animation
  final bool startAnimation;

  /// Repeat the animation in circular rotation widget.
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
  final int? firstCircleAnimationDuration;

  /// Set the animation duration in seconds for the second circle.
  /// This parameter affects when [startAnimation] is true.
  ///
  /// it contains [int] value.
  final int? secondCircleAnimationDuration;

  /// Set the animation duration in seconds for the third circle.
  /// This parameter affects when [startAnimation] is true.
  ///
  /// it contains [int] value.
  final int? thirdCircleAnimationDuration;

  ///  [Curves], a collection of common animation easing curves.
  ///  [CurveTween], which can be used to apply a [Curve] to an [Animation].
  ///
  /// Default value is Curves.linear
  final Curve curve;

  ///  [onFirstAnimationEnd] Once you set this then you will get the callback once first circle is completes the round.
  ///
  /// Default value is null
  final Function? onFirstAnimationEnd;

  ///  [onSecondAnimationEnd] Once you set this then you will get the callback once first circle is completes the round.
  ///
  /// Default value is null
  final Function? onSecondAnimationEnd;

  ///  [onThirdAnimationEnd] Once you set this then you will get the callback once first circle is completes the round.
  ///
  /// Default value is null
  final Function? onThirdAnimationEnd;

  CircularRotationModel({
    this.visibleFirstCircle = true,
    this.visibleSecondCircle = true,
    this.visibleThirdCircle = true,
    this.firstCircleRadius,
    this.secondCircleRadius,
    this.thirdCircleRadius,
    this.firstCircleRadians = 0,
    this.secondCircleRadians = 0.5,
    this.thirdCircleRadians = 1,
    this.firstCircleWidgets,
    this.secondCircleWidgets,
    this.thirdCircleWidgets,
    this.centerWidget,
    this.defaultCircleStrokeColor = AppColors.black,
    this.firstCircleStrokeColor,
    this.secondCircleStrokeColor,
    this.thirdCircleStrokeColor,
    this.defaultCircleStrokeWidth = 1,
    this.firstCircleStrokeWidth,
    this.secondCircleStrokeWidth,
    this.thirdCircleStrokeWidth,
    this.startAnimation = false,
    this.repeatAnimation = false,
    this.defaultCircleAnimationDuration = 0,
    this.firstCircleAnimationDuration,
    this.secondCircleAnimationDuration,
    this.thirdCircleAnimationDuration,
    this.curve = Curves.linear,
    this.onFirstAnimationEnd,
    this.onSecondAnimationEnd,
    this.onThirdAnimationEnd,
    Key? key,
  });
}
