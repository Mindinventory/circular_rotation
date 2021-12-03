part of planet_widget;

class DrawCirclePainter extends CustomPainter {
  static late ui.Size paintSize;

  final BuildContext context;
  final VoidCallback onDrawCompleteCallback;

  late PlanetWidgetModel _planetWidgetModel;

  DrawCirclePainter({
    required this.context,
    required this.onDrawCompleteCallback,
  });

  @override
  void paint(Canvas canvas, Size size) {
    _planetWidgetModel =
        PlanetWidgetInheritedModel.of(context).planetWidgetModel;
    drawCircles(canvas, size);
  }

  drawCircles(Canvas canvas, Size size) {
    paintSize = size;
    _radius = (size.width < size.height) ? (size.width / 2) : (size.height / 2);
    _circleCenter = Offset(size.width / 2, size.height / 2);

    if (_planetWidgetModel.visibleFirstCircle) {
      createFirstCircle(
        canvas: canvas,
        size: size,
      );
    }
    if (_planetWidgetModel.visibleSecondCircle) {
      createSecondCircle(
        canvas: canvas,
        size: size,
      );
    }
    if (_planetWidgetModel.visibleThirdCircle) {
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
    _firstRadius = _radius - ((_planetWidgetModel.firstCircleRadius!=-1) ? _planetWidgetModel.firstCircleRadius : _radius / 12);
    createCircle(
      canvas: canvas,
      size: size,
      radius: _firstRadius,
      paint: getPaint(
        color: (_planetWidgetModel.firstCircleStrokeColor != null)
            ? _planetWidgetModel.firstCircleStrokeColor!
            : _planetWidgetModel.defaultCircleStrokeColor,
        strokeWidth: (_planetWidgetModel.firstCircleStrokeWidth != -1)
            ? _planetWidgetModel.firstCircleStrokeWidth
            : _planetWidgetModel.defaultCircleStrokeWidth,
      ),
    );
  }

  createSecondCircle({
    required Canvas canvas,
    required Size size,
  }) async {
    _secondRadius = _firstRadius - ((_planetWidgetModel.secondCircleRadius!=-1) ? _planetWidgetModel.secondCircleRadius : _radius / 6);
    createCircle(
      canvas: canvas,
      size: size,
      radius: _secondRadius,
      paint: getPaint(
        color: (_planetWidgetModel.secondCircleStrokeColor != null)
            ? _planetWidgetModel.secondCircleStrokeColor!
            : _planetWidgetModel.defaultCircleStrokeColor,
        strokeWidth: (_planetWidgetModel.secondCircleStrokeWidth != -1)
            ? _planetWidgetModel.secondCircleStrokeWidth
            : _planetWidgetModel.defaultCircleStrokeWidth,
      ),
    );
  }

  void createThirdCircle({
    required Canvas canvas,
    required Size size,
  }) {
    _thirdRadius = _secondRadius - ((_planetWidgetModel.thirdCircleRadius!=-1) ? _planetWidgetModel.thirdCircleRadius : _radius / 4);
    createCircle(
      canvas: canvas,
      size: size,
      radius: _thirdRadius,
      paint: getPaint(
        color: (_planetWidgetModel.thirdCircleStrokeColor != null)
            ? _planetWidgetModel.thirdCircleStrokeColor!
            : _planetWidgetModel.defaultCircleStrokeColor,
        strokeWidth: (_planetWidgetModel.thirdCircleStrokeWidth != -1)
            ? _planetWidgetModel.thirdCircleStrokeWidth
            : _planetWidgetModel.defaultCircleStrokeWidth,
      ),
    );
  }

  Rect createCircle(
      {required Canvas canvas,
      required Size size,
      required double radius,
      required Paint paint}) {
    // Using drawCircle
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
