part of planet_widget;

Widget calculatePositionedWidget({
  required int index,
  required int totalElements,
  required double size,
  required double circleRadius,
  required double circleRadians,
  required Size circleWidgetsSize,
  required Widget child,
}) {
  var elementPosition = size + circleRadians;
  var radians = ((elementPosition) * 2 * math.pi) / totalElements;
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
