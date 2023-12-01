part of circular_rotation;

class CircleWidgetsThird extends StatefulWidget {
  const CircleWidgetsThird({Key? key}) : super(key: key);

  @override
  State<CircleWidgetsThird> createState() => _CircleWidgetsThirdState();
}

class _CircleWidgetsThirdState extends State<CircleWidgetsThird> {
  late CircularRotationModel _circularRotationModel;
  final List<Widget> _circleWidgets = [];
  final List<Size> _circleWidgetsSize = [];
  final ValueNotifier<bool> _refreshScreen = ValueNotifier(false);
  late CircleAnimationStatus _circleAnimationStatus;
  bool _startAnimation = false;
  int _totalElements = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _circularRotationModel = CircularRotationInheritedModel.of(context).circularRotationModel;
    _circleAnimationStatus = _getCircleAnimationStatus();
    _startAnimation = _circularRotationModel.startAnimation;
    _totalElements = _circularRotationModel.thirdCircleWidgets?.length ?? 0;
  }

  CircleAnimationStatus _getCircleAnimationStatus() =>
      (_circularRotationModel.startAnimation) ? CircleAnimationStatus.start : CircleAnimationStatus.idle;

  @override
  void initState() {
    _setSchedulerBinding();
    _setListeners();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _refreshScreen,
      builder: (_, __, ___) {
        _initData();
        return Stack(
          children: _circleWidgets,
        );
      },
    );
  }

  void _initData() {
    if (_circleWidgetsSize.isNotEmpty) {
      _circleWidgets.clear();
    }
    if (_circularRotationModel.thirdCircleWidgets?.isNotEmpty ?? false) {
      _circularRotationModel.thirdCircleWidgets?.asMap().forEach(
        (index, child) {
          _circleWidgets.add(
            TweenBuilderWidget(
              key: GlobalKey(),
              index: index,
              begin: index.toDouble(),
              end: _calculateWidgetEndPosition(index),
              animationDuration: _calculateAnimationDuration(),
              curve: _circularRotationModel.curve,
              child: child,
              onWidgetBuild: (double size, Widget child) => _onWidgetBuild(index, size, child),
              onAnimationEnd: _onAnimationEnd,
            ),
          );
        },
      );
    }
  }

  double _calculateWidgetEndPosition(int index) => (_startAnimation) ? (index + _totalElements).toDouble() : index.toDouble();

  int _calculateAnimationDuration() => _circularRotationModel.thirdCircleAnimationDuration ?? _circularRotationModel.defaultCircleAnimationDuration;

  _onAnimationEnd() {
    _circularRotationModel.onThirdAnimationEnd?.call();
    if (_circularRotationModel.repeatAnimation) {
      _updateScreen();
    } else {
      _circleAnimationStatus = CircleAnimationStatus.stop;
    }
  }

  Widget _onWidgetBuild(int index, double size, Widget child) {
    return CalculatePositionWidget(
      index: index,
      totalElements: _totalElements,
      size: size,
      circleRadius: _thirdRadius,
      circleRadians: _circularRotationModel.thirdCircleRadians,
      circleWidgetsSize: (_circleWidgetsSize.length > index) ? _circleWidgetsSize[index] : const Size(0, 0),
      child: child,
    );
  }

  void _setSchedulerBinding() {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      for (var element in _circleWidgets) {
        _circleWidgetsSize.add(element.calculateWidgetHalfSize());
      }
      _updateScreen();
    });
  }

  void _resetCircleAnimation() {
    if (_circleAnimationStatus != CircleAnimationStatus.stop) {
      _startAnimation = false;
      _circleAnimationStatus = CircleAnimationStatus.stop;
      _updateScreen();
    }
  }

  void _startCircleAnimation() {
    if (_circleAnimationStatus != CircleAnimationStatus.start) {
      _startAnimation = true;
      _circleAnimationStatus = CircleAnimationStatus.start;
      _updateScreen();
    }
  }

  void _eitherStartOrStop() => (_circleAnimationStatus != CircleAnimationStatus.start) ? _startCircleAnimation() : _resetCircleAnimation();

  void _updateScreen() {
    _refreshScreen.value = !_refreshScreen.value;
  }

  void _setListeners() {
    controllerUserAction.stream.listen((event) {
      switch (event) {
        case CircleAnimationStatus.start:
          _startCircleAnimation();
          break;
        case CircleAnimationStatus.stop:
          _resetCircleAnimation();
          break;
        case CircleAnimationStatus.idle:
          break;
        case CircleAnimationStatus.refreshScreen:
          _updateScreen();
          break;
        case CircleAnimationStatus.startStop:
          _eitherStartOrStop();
          break;
      }
    });
  }
}
