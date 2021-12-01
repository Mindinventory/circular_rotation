part of planet_widget;

class TweenBuilderWidget extends StatelessWidget {
  final Widget child;
  final int currentElementPosition;
  final int totalElementsLength;
  final int animationDuration;
  final double circleRadius;
  final double circleRadians;
  final bool startAnimation;
  final List<Size> circleWidgetsSize;
  final HashMap<int, Widget> mapWidgets = HashMap();
  final VoidCallback onEndCallback;
  late PlanetWidgetModel _planetWidgetModel;

  TweenBuilderWidget({
    required this.child,
    required this.currentElementPosition,
    required this.totalElementsLength,
    required this.animationDuration,
    required this.circleRadius,
    required this.circleRadians,
    required this.circleWidgetsSize,
    required this.startAnimation,
    required this.onEndCallback,
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    _planetWidgetModel = PlanetWidgetModel.of(context);
    return _buildBody();
  }

  Widget _buildBody(){
    return TweenAnimationBuilder<double>(
      curve: _planetWidgetModel.curve,
      child: child,
      tween: Tween(
        begin: currentElementPosition.toDouble(),
        end: (startAnimation)
            ? (currentElementPosition + totalElementsLength).toDouble()
            : currentElementPosition.toDouble(),
      ),
      duration: Duration(
        milliseconds: (animationDuration != -1)
            ? animationDuration
            : _planetWidgetModel.defaultCircleAnimationDuration,
      ),
      onEnd: onEndCallback,
      builder: (BuildContext context, double size, Widget? child) {
        var elementPosition = size + circleRadians;
        var radians = ((elementPosition) * 2 * math.pi) / totalElementsLength;
        Offset pointOnCircle = Offset(
          circleRadius * math.cos(radians) +
              _circleCenter.dx -
              ((circleWidgetsSize.length > currentElementPosition)
                  ? circleWidgetsSize[currentElementPosition].width
                  : 0),
          circleRadius * math.sin(radians) +
              _circleCenter.dy -
              ((circleWidgetsSize.length > currentElementPosition)
                  ? circleWidgetsSize[currentElementPosition].height
                  : 0),
        );
        var positionedWidget = Positioned(
          left: pointOnCircle.dx,
          top: pointOnCircle.dy,
          child: child!,
        );
        if (mapWidgets.containsKey(currentElementPosition)) {
          mapWidgets.update(
            currentElementPosition,
                (value) => positionedWidget,
          );
        } else {
          mapWidgets.putIfAbsent(
            currentElementPosition,
                () => positionedWidget,
          );
        }
        return mapWidgets[currentElementPosition]!;
      },
    );
  }

}
