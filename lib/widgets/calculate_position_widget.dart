part of circular_rotation;

class CalculatePositionWidget extends StatelessWidget {
  const CalculatePositionWidget(
      {required this.index,
      required this.totalElements,
      required this.size,
      required this.circleRadius,
      required this.circleRadians,
      required this.circleWidgetsSize,
      required this.child,
      Key? key})
      : super(key: key);

  final int index;
  final int totalElements;
  final double size;
  final double circleRadius;
  final double circleRadians;
  final Size circleWidgetsSize;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    var elementPosition = size + circleRadians;

    /// Calculating position of element.
    /// [radians] will calculates on circle(means math.pi * 2) and total elements[totalElements].
    var radians = ((elementPosition) * 2 * math.pi) / totalElements;

    /// Here, we are calculating offset of widget to place on screen with center in circle stroke.
    Offset pointOnCircle = Offset(
      circleRadius * math.cos(radians) +
          _circleCenter.dx -
          circleWidgetsSize.width,
      circleRadius * math.sin(radians) +
          _circleCenter.dy -
          circleWidgetsSize.height,
    );
    var positionedWidget = Positioned(
      left: pointOnCircle.dx,
      top: pointOnCircle.dy,
      child: child,
    );
    return positionedWidget;
  }
}
