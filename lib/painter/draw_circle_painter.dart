part of planet_widget;

class DrawCirclePainter extends CustomPainter {
  static late ui.Size paintSize;

  final double allCircleStrokeWidth;
  final double firstCircleStrokeWidth;
  final double secondCircleStrokeWidth;
  final double thirdCircleStrokeWidth;

  final Color allCircleStrokeColor;
  final Color? firstCircleStrokeColor;
  final Color? secondCircleStrokeColor;
  final Color? thirdCircleStrokeColor;

  final bool visibleFirstCircle;
  final bool visibleSecondCircle;
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

  final VoidCallback onDrawCompleteCallback;

  const DrawCirclePainter({
    required this.allCircleStrokeColor,
    required this.firstCircleStrokeColor,
    required this.secondCircleStrokeColor,
    required this.thirdCircleStrokeColor,
    required this.allCircleStrokeWidth,
    required this.firstCircleStrokeWidth,
    required this.secondCircleStrokeWidth,
    required this.thirdCircleStrokeWidth,
    required this.visibleFirstCircle,
    required this.visibleSecondCircle,
    required this.visibleThirdCircle,
    required this.firstCircleRadius,
    required this.secondCircleRadius,
    required this.thirdCircleRadius,
    required this.onDrawCompleteCallback,
  });

  @override
  void paint(Canvas canvas, Size size) {
    drawCircles(canvas, size);
  }

  drawCircles(Canvas canvas, Size size) {
    paintSize = size;
    _radius = (size.width < size.height) ? (size.width / 2) : (size.height / 2);
    if (visibleFirstCircle) {
      createFirstCircle(
        canvas: canvas,
        size: size,
      );
    }
    if (visibleSecondCircle) {
      createSecondCircle(
        canvas: canvas,
        size: size,
      );
    }
    if (visibleThirdCircle) {
      createThirdCircle(
        canvas: canvas,
        size: size,
      );
    }
    onDrawCompleteCallback.call();
  }

  createFirstCircle({
    required Canvas canvas,
    required Size size,
  }) async {
    _firstRadius = _radius - firstCircleRadius;
    createCircle(
      canvas: canvas,
      size: size,
      radius: _firstRadius,
      paint: getPaint(
        color: (firstCircleStrokeColor != null)
            ? firstCircleStrokeColor!
            : allCircleStrokeColor,
        strokeWidth: (firstCircleStrokeWidth != -1)
            ? firstCircleStrokeWidth
            : allCircleStrokeWidth,
      ),
    );
  }

  createSecondCircle({
    required Canvas canvas,
    required Size size,
  }) async {
    _secondRadius = _firstRadius - secondCircleRadius;
    createCircle(
      canvas: canvas,
      size: size,
      radius: _secondRadius,
      paint: getPaint(
        color: (secondCircleStrokeColor != null)
            ? secondCircleStrokeColor!
            : allCircleStrokeColor,
        strokeWidth: (secondCircleStrokeWidth != -1)
            ? secondCircleStrokeWidth
            : allCircleStrokeWidth,
      ),
    );
  }

  void createThirdCircle({
    required Canvas canvas,
    required Size size,
  }) {
    _thirdRadius = _secondRadius - thirdCircleRadius;
    createCircle(
      canvas: canvas,
      size: size,
      radius: _thirdRadius,
      paint: getPaint(
        color: (thirdCircleStrokeColor != null)
            ? thirdCircleStrokeColor!
            : allCircleStrokeColor,
        strokeWidth: (thirdCircleStrokeWidth != -1)
            ? thirdCircleStrokeWidth
            : allCircleStrokeWidth,
      ),
    );
  }

  Rect createCircle(
      {required Canvas canvas,
      required Size size,
      required double radius,
      required Paint paint}) {
    // Using drawCircle
    _circleCenter = Offset(size.width / 2, size.height / 2);
    var path = Path();
    path.addOval(
      Rect.fromCircle(center: _circleCenter, radius: radius),
    );
    canvas.drawPath(path, paint);
    return path.getBounds();
  }

  Paint getPaint({required Color color, required double strokeWidth}) {
    return Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
