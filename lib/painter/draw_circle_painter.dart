part of circular_rotation;

class DrawCirclePainter extends CustomPainter {
  final BuildContext context;
  final VoidCallback onCircleDrawComplete;

  late CircularRotationModel _circularRotationModel;

  DrawCirclePainter({
    required this.context,
    required this.onCircleDrawComplete,
  });

  @override
  void paint(Canvas canvas, Size size) {
    _circularRotationModel = CircularRotationInheritedModel.of(context).circularRotationModel;
    drawCircles(canvas, size);
  }

  drawCircles(Canvas canvas, Size size) {
    _radius = _calculateRadius(canvas, size);

    _circleCenter = _calculateCircleOffset(size);

    if (_circularRotationModel.visibleFirstCircle) {
      _createFirstCircle(
        canvas: canvas,
        size: size,
        fill: _circularRotationModel.firstCircleFill,
        firstCircleFillColor: _circularRotationModel.firstCircleFillColor,
      );
    }
    if (_circularRotationModel.visibleSecondCircle) {
      _createSecondCircle(
        canvas: canvas,
        size: size,
        fill: _circularRotationModel.secondCircleFill,
        secondCircleFillColor: _circularRotationModel.secondCircleFillColor,
      );
    }
    if (_circularRotationModel.visibleThirdCircle) {
      _createThirdCircle(
        canvas: canvas,
        size: size,
        fill: _circularRotationModel.thirdCircleFill,
        thirdCircleFillColor: _circularRotationModel.thirdCircleFillColor,
      );
    }
    onCircleDrawComplete.call();
  }

  /// Calculating radius with divide by 2 of screen width and height.
  double _calculateRadius(Canvas canvas, Size size) => (size.width < size.height) ? (size.width / 2) : (size.height / 2);

  /// Calculating offset with divide by 2 of screen width and height.
  ui.Offset _calculateCircleOffset(Size size) => Offset(size.width / 2, size.height / 2);

  _createFirstCircle({required Canvas canvas, required Size size, required bool fill, required Color firstCircleFillColor}) async {
    _firstRadius = _calculateFirstCircleRadius();
    _createCircle(
      canvas: canvas,
      size: size,
      radius: _firstRadius,
      paint: _getPaint(
        color: fill ? firstCircleFillColor : _getFirstCircleStokeColor(),
        strokeWidth: _getFirstCircleWidth(),
        fill: fill,
      ),
    );
  }

  _createSecondCircle({required Canvas canvas, required Size size, required bool fill, required Color secondCircleFillColor}) async {
    _secondRadius = _calculateSecondCircleRadius();
    _createCircle(
      canvas: canvas,
      size: size,
      radius: _secondRadius,
      paint: _getPaint(
        color: fill ? secondCircleFillColor : _getSecondCircleStokeColor(),
        strokeWidth: _getSecondCircleWidth(),
        fill: fill,
      ),
    );
  }

  _createThirdCircle({required Canvas canvas, required Size size, required bool fill, required Color thirdCircleFillColor}) {
    _thirdRadius = _calculateThirdCircleRadius();
    _createCircle(
      canvas: canvas,
      size: size,
      radius: _thirdRadius,
      paint: _getPaint(
        color: fill ? thirdCircleFillColor : _getThirdCircleStokeColor(),
        strokeWidth: _getThirdCircleWidth(),
        fill: fill,
      ),
    );
  }

  double _calculateFirstCircleRadius() => _radius - (_circularRotationModel.firstCircleRadius ?? _radius / Dimens.radius_normal);

  Color _getFirstCircleStokeColor() => _circularRotationModel.firstCircleStrokeColor ?? _circularRotationModel.defaultCircleStrokeColor;

  double _getFirstCircleWidth() => _circularRotationModel.firstCircleStrokeWidth ?? _circularRotationModel.defaultCircleStrokeWidth;

  double _calculateSecondCircleRadius() => _firstRadius - (_circularRotationModel.secondCircleRadius ?? _radius / Dimens.radius_small);

  Color _getSecondCircleStokeColor() => _circularRotationModel.secondCircleStrokeColor ?? _circularRotationModel.defaultCircleStrokeColor;

  double _getSecondCircleWidth() => _circularRotationModel.secondCircleStrokeWidth ?? _circularRotationModel.defaultCircleStrokeWidth;

  double _calculateThirdCircleRadius() => _secondRadius - (_circularRotationModel.thirdCircleRadius ?? _radius / Dimens.radius_xsmall);

  Color _getThirdCircleStokeColor() => _circularRotationModel.thirdCircleStrokeColor ?? _circularRotationModel.defaultCircleStrokeColor;

  double _getThirdCircleWidth() => _circularRotationModel.thirdCircleStrokeWidth ?? _circularRotationModel.defaultCircleStrokeWidth;

  Rect _createCircle({required Canvas canvas, required Size size, required double radius, required Paint paint}) {
    var path = Path();
    path.addOval(
      Rect.fromCircle(center: _circleCenter, radius: radius),
    );
    canvas.drawPath(path, paint);
    return path.getBounds();
  }

  Paint _getPaint({required Color color, required double strokeWidth, required bool fill}) {
    return Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = fill ? PaintingStyle.fill : PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
